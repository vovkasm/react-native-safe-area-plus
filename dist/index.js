// tslint:disable:max-classes-per-file
import React from 'react';
import { requireNativeComponent, StyleSheet } from 'react-native';
const s = StyleSheet.create({
    host: {
        bottom: 0,
        left: 0,
        position: 'absolute',
        right: 0,
        top: 0,
    },
});
const VTSafeAreaHostView = requireNativeComponent('VTSafeAreaHostView');
export class SafeAreaHost extends React.Component {
    render() {
        return React.createElement(VTSafeAreaHostView, { children: this.props.children, style: s.host });
    }
}
const VTSafeAreaView = requireNativeComponent('VTSafeAreaView');
/**
 * Renders nested content and automatically applies paddings reflect the portion of the view
 * that is not covered by navigation bars, tab bars, toolbars, and other ancestor views.
 * Moreover, and most importantly, Safe Area's paddings reflect physical limitation of the screen,
 * such as rounded corners or camera notches (aka sensor housing area on iPhone X).
 */
export class SafeAreaView extends React.Component {
    render() {
        return React.createElement(VTSafeAreaView, Object.assign({}, this.props));
    }
}
