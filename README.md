# React Native Loud Speaker

A node modules can open loud speaker for react native.
Support for ios and android.

# Installation

```sh
npm install react-native-loud-speaker --save
```
### Installation (iOS)
* Drag LoudSpeaker.xcodeproj to your project on Xcode.
* Click on your main project file (the one that represents the .xcodeproj) select Build Phases and drag libLoudSpeaker.a from the Products folder inside the LoudSpeaker.xcodeproj.

### Installation (Android)
```gradle
...
include ':react-native-loud-speaker'
project(':react-native-loud-speaker').projectDir = new File(settingsDir, '../node_modules/react-native-loud-speaker/android')
```

* In `android/app/build.gradle`

```gradle
...
dependencies {
    ...
    compile project(':react-native-loud-speaker')
}
```

* register module (in MainApplication.java)

```java
......
import com.loudspeaker.LoudSpeakerPackage;  // <--- import
......

@Override
protected List<ReactPackage> getPackages() {
   ......
   new LoudSpeakerPackage(),            // <------ add here
   ......
}

```

### Usage

```
import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TouchableOpacity
} from 'react-native';
import LoudSpeaker from 'react-native-loud-speaker'

export default class App extends Component<{}> {
  onOpen = () => {
    LoudSpeaker.open(true)
  }	
  
  onAbout = () => {
    LoudSpeaker.about()
      .then(data => {
        alert(data)
      })
      .catch(e => {
        alert(e)
      })
  }
  
  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity onPress={this.onOpen} style={styles.button}>
	        <Text>Open</Text>
        </TouchableOpacity>
		<TouchableOpacity onPress={this.onAbout} style={styles.button}>
	        <Text>Open</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  button: {
    height: 45, 
    width: 150, 
    backgroundColor: 'red',
    margin: 10
  },
});
```