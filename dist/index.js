"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const tslib_1 = require("tslib");
const react_1 = tslib_1.__importDefault(require("react"));
const react_native_1 = require("react-native");
const VTSafeAreaView = react_native_1.requireNativeComponent('VTSafeAreaView');
/**
 * Renders nested content and automatically applies paddings reflect the portion of the view
 * that is not covered by navigation bars, tab bars, toolbars, and other ancestor views.
 * Moreover, and most importantly, Safe Area's paddings reflect physical limitation of the screen,
 * such as rounded corners or camera notches (aka sensor housing area on iPhone X).
 */
class SafeAreaView extends react_1.default.Component {
    render() {
        return <VTSafeAreaView {...this.props}/>;
    }
}
exports.SafeAreaView = SafeAreaView;
