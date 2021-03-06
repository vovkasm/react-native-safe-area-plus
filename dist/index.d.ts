import React from 'react';
import { ViewProps } from 'react-native';
export declare class SafeAreaHost extends React.Component<{}> {
    render(): React.ComponentElement<Readonly<{
        children?: React.ReactNode;
    }> & Readonly<ViewProps>, React.Component<ViewProps, React.ComponentState, any>>;
}
/**
 * Renders nested content and automatically applies paddings reflect the portion of the view
 * that is not covered by navigation bars, tab bars, toolbars, and other ancestor views.
 * Moreover, and most importantly, Safe Area's paddings reflect physical limitation of the screen,
 * such as rounded corners or camera notches (aka sensor housing area on iPhone X).
 */
export declare class SafeAreaView extends React.Component<ViewProps> {
    render(): JSX.Element;
}
