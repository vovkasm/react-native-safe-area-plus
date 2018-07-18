import React from 'react'
import { StyleSheet, View } from 'react-native'

import { SafeAreaView } from 'react-native-safe-area-plus'

const s = StyleSheet.create({
  content: {
    backgroundColor: 'rgb(0, 255, 0)',
    flex: 1,
  },
  safeArea: {
    flex: 1,
  },
})

export default class App extends React.Component {
  render() {
    return <SafeAreaView style={s.safeArea}><View style={s.content} /></SafeAreaView>
  }
}