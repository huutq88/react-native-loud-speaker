'use strict';

import { NativeModules, Platform, NativeEventEmitter } from 'react-native';
const { LoudSpeaker } = NativeModules;

const LoudSpeakers = {
	open: LoudSpeaker.open,
	about: LoudSpeaker.about,
}

export { LoudSpeakers };
export default LoudSpeakers;
