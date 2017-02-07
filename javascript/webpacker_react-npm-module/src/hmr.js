import { AppContainer } from 'react-hot-loader';
import WebpackerReact from 'webpacker-react';
import React from 'react';

WebpackerReact.registerWrapForHMR(function(reactElement) {
  return React.createElement(AppContainer, {}, reactElement);
});

export default WebpackerReact;
