function postMessageToWebkit(event, message) {
  if (window.webkit && window.webkit.messageHandlers[event]) {
    window.webkit.messageHandlers[event].postMessage(message);
  }
}