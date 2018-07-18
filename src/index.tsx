import React from 'react'
import { requireNativeComponent, ViewProps } from 'react-native'

const VTSafeAreaView = requireNativeComponent<ViewProps>('VTSafeAreaView')

/**
 * Renders nested content and automatically applies paddings reflect the portion of the view
 * that is not covered by navigation bars, tab bars, toolbars, and other ancestor views.
 * Moreover, and most importantly, Safe Area's paddings reflect physical limitation of the screen,
 * such as rounded corners or camera notches (aka sensor housing area on iPhone X).
 */
export class SafeAreaView extends React.Component<ViewProps> {
  render () {
    return <VTSafeAreaView {...this.props} />
  }
}
