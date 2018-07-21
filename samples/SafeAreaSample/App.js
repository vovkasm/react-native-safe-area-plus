import React from 'react'
import { StyleSheet, View } from 'react-native'

import { SafeAreaHost, SafeAreaView } from 'react-native-safe-area-plus'

const s = StyleSheet.create({
  background: {
    backgroundColor: 'red',
    flex: 1,
  },
  content: {
    backgroundColor: 'green',
    flex: 1,
  },
  safeArea: {
    position: 'absolute',
    top: 0, left: 0, right: 0, bottom: 0,
  },
})

export default class App extends React.Component {
  render() {
    return (
      <SafeAreaHost>
        <View style={s.background}>
          <SafeAreaView style={s.safeArea}>
            <View onLayout={this.onContentLayout} style={s.content} />
          </SafeAreaView>
        </View>
      </SafeAreaHost>
    )
  }
  onContentLayout = (e) => {
    // console.log(e.nativeEvent)
  }
}