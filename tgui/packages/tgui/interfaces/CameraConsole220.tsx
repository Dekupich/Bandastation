import { sortBy } from 'es-toolkit';
import { filter } from 'es-toolkit/compat';
import { useState } from 'react';
import {
  Button,
  ByondUi,
  Input,
  NoticeBox,
  Section,
  Stack,
  Tabs,
} from 'tgui-core/components';
import { type BooleanLike, classes } from 'tgui-core/react';
import { createSearch } from 'tgui-core/string';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import { type MapData, NanoMap } from './common/NanoMap';

type Data = {
  activeCamera: Camera & { status: BooleanLike };
  cameras: Camera[];
  can_spy: BooleanLike;
  mapRef: string;
  network: string[];
  mapData: MapData;
};

type Camera = {
  name: string;
  ref: string;
  x: number;
  y: number;
  z: number;
  status: BooleanLike;
};

/**
 * Returns previous and next camera names relative to the currently
 * active camera.
 */
const prevNextCamera = (
  cameras: Camera[],
  activeCamera: Camera & { status: BooleanLike },
) => {
  if (!activeCamera || cameras.length < 2) {
    return [];
  }

  const index = cameras.findIndex((camera) => camera.ref === activeCamera.ref);

  switch (index) {
    case -1: // Current camera is not in the list
      return [cameras[cameras.length - 1].ref, cameras[0].ref];

    case 0: // First camera
      if (cameras.length === 2) return [cameras[1].ref, cameras[1].ref]; // Only two

      return [cameras[cameras.length - 1].ref, cameras[index + 1].ref];

    case cameras.length - 1: // Last camera
      if (cameras.length === 2) return [cameras[0].ref, cameras[0].ref];

      return [cameras[index - 1].ref, cameras[0].ref];

    default:
      // Middle camera
      return [cameras[index - 1].ref, cameras[index + 1].ref];
  }
};

/**
 * Camera selector.
 *
 * Filters cameras, applies search terms and sorts the alphabetically.
 */
const selectCameras = (cameras: Camera[], searchText = ''): Camera[] => {
  let queriedCameras = filter(cameras, (camera: Camera) => !!camera.name);
  if (searchText) {
    const testSearch = createSearch(
      searchText,
      (camera: Camera) => camera.name,
    );
    queriedCameras = filter(queriedCameras, testSearch);
  }
  queriedCameras = sortBy(queriedCameras, [(c) => c.name]);

  return queriedCameras;
};

export const CameraConsole220 = (props) => {
  return (
    <Window width={1170} height={775}>
      <Window.Content>
        <CameraContent />
      </Window.Content>
    </Window>
  );
};

export const CameraContent = (props) => {
  const [searchText, setSearchText] = useState('');
  const [tab, setTab] = useState('Map');
  const decideTab = (tab) => {
    switch (tab) {
      case 'List':
        return (
          <CameraListSelector
            searchText={searchText}
            setSearchText={setSearchText}
          />
        );
      case 'Map':
        return <CameraMapSelector />;
      default:
        return "WE SHOULDN'T BE HERE!";
    }
  };

  return (
    <Stack fill g={0}>
      <Stack.Item grow minWidth={0}>
        <Stack fill vertical g={0}>
          <Stack.Item textAlign="center">
            <Tabs fluid>
              <Tabs.Tab
                key="Map"
                icon="map-marked-alt"
                selected={tab === 'Map'}
                onClick={() => setTab('Map')}
              >
                Карта
              </Tabs.Tab>
              <Tabs.Tab
                key="List"
                icon="table"
                selected={tab === 'List'}
                onClick={() => setTab('List')}
              >
                Список
              </Tabs.Tab>
            </Tabs>
          </Stack.Item>
          <Stack.Item grow>{decideTab(tab)}</Stack.Item>
        </Stack>
      </Stack.Item>
      <Stack.Item grow={tab === 'Map' ? 1.5 : 3}>
        <CameraControls searchText={searchText} />
      </Stack.Item>
    </Stack>
  );
};

const CameraListSelector = (props) => {
  const { act, data } = useBackend<Data>();
  const { searchText, setSearchText } = props;
  const { activeCamera } = data;
  const cameras = selectCameras(data.cameras, searchText);

  return (
    <Stack fill vertical>
      <Stack.Item mt={1}>
        <Input
          autoFocus
          expensive
          fluid
          placeholder="Search for a camera"
          onChange={setSearchText}
          value={searchText}
        />
      </Stack.Item>
      <Stack.Item grow>
        <Section fill scrollable>
          {cameras.map((camera) => (
            // We're not using the component here because performance
            // would be absolutely abysmal (50+ ms for each re-render).
            <div
              key={camera.ref}
              title={camera.name}
              className={classes([
                'Button',
                'Button--fluid',
                'Button--color--transparent',
                'Button--ellipsis',
                activeCamera?.ref === camera.ref
                  ? 'Button--selected'
                  : 'candystripe',
              ])}
              onClick={() =>
                act('switch_camera', {
                  camera: camera.ref,
                })
              }
            >
              {camera.name}
            </div>
          ))}
        </Section>
      </Stack.Item>
    </Stack>
  );
};

export const CameraMapSelector = (props) => {
  const { act, data } = useBackend<Data>();
  const { activeCamera, mapData } = data;
  const cameras = selectCameras(data.cameras, '');
  const [selectedLevel, setSelectedLevel] = useState<number>(mapData.mainFloor);

  return (
    <NanoMap mapData={mapData} onLevelChange={setSelectedLevel}>
      {cameras.map((camera) => (
        <NanoMap.Button
          key={camera.ref}
          posX={camera.x}
          posY={camera.y}
          tooltip={camera.name}
          color={!camera.status && 'bad'}
          selected={activeCamera?.ref === camera.ref}
          hidden={camera.z !== selectedLevel}
          onClick={() =>
            act('switch_camera', {
              camera: camera.ref,
            })
          }
        />
      ))}
    </NanoMap>
  );
};

const CameraControls = (props: { searchText: string }) => {
  const { act, data } = useBackend<Data>();
  const { activeCamera, can_spy, mapRef } = data;
  const { searchText } = props;

  const cameras = selectCameras(data.cameras, searchText);
  const [prevCamera, nextCamera] = prevNextCamera(cameras, activeCamera);

  return (
    <Section fill>
      <Stack fill vertical>
        <Stack.Item>
          <Stack fill>
            <Stack.Item grow>
              {activeCamera?.status ? (
                <NoticeBox info>{activeCamera.name}</NoticeBox>
              ) : (
                <NoticeBox danger>No input signal</NoticeBox>
              )}
            </Stack.Item>
            <Stack.Item>
              {!!can_spy && (
                <Button
                  icon="magnifying-glass"
                  tooltip="Track Person"
                  onClick={() => act('start_tracking')}
                />
              )}
            </Stack.Item>
            <Stack.Item>
              <Button
                icon="chevron-left"
                disabled={!prevCamera}
                onClick={() =>
                  act('switch_camera', {
                    camera: prevCamera,
                  })
                }
              />
            </Stack.Item>
            <Stack.Item>
              <Button
                icon="chevron-right"
                disabled={!nextCamera}
                onClick={() =>
                  act('switch_camera', {
                    camera: nextCamera,
                  })
                }
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item grow>
          <ByondUi
            height="100%"
            width="100%"
            params={{
              id: mapRef,
              type: 'map',
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};
