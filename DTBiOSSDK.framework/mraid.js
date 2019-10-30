/*! MRAID_APS_3.0 - v1.0.0 - 2019-04-25 19:44:36 */ !function(modules) {
    var installedModules = {};
    function __webpack_require__(moduleId) {
        if (installedModules[moduleId]) return installedModules[moduleId].exports;
        var module = installedModules[moduleId] = {
        i: moduleId,
        l: !1,
        exports: {}
        };
        return modules[moduleId].call(module.exports, module, module.exports, __webpack_require__),
        module.l = !0, module.exports;
    }
    __webpack_require__.m = modules, __webpack_require__.c = installedModules, __webpack_require__.d = function(exports, name, getter) {
        __webpack_require__.o(exports, name) || Object.defineProperty(exports, name, {
                                                                      enumerable: !0,
                                                                      get: getter
                                                                      });
    }, __webpack_require__.r = function(exports) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(exports, Symbol.toStringTag, {
                                                                                    value: "Module"
                                                                                    }), Object.defineProperty(exports, "__esModule", {
                                                                                                              value: !0
                                                                                                              });
    }, __webpack_require__.t = function(value, mode) {
        if (1 & mode && (value = __webpack_require__(value)), 8 & mode) return value;
        if (4 & mode && "object" == typeof value && value && value.__esModule) return value;
        var ns = Object.create(null);
        if (__webpack_require__.r(ns), Object.defineProperty(ns, "default", {
                                                             enumerable: !0,
                                                             value: value
                                                             }), 2 & mode && "string" != typeof value) for (var key in value) __webpack_require__.d(ns, key, function(key) {
                                                                                                                                                    return value[key];
                                                                                                                                                    }.bind(null, key));
        return ns;
    }, __webpack_require__.n = function(module) {
        var getter = module && module.__esModule ? function() {
            return module.default;
        } : function() {
            return module;
        };
        return __webpack_require__.d(getter, "a", getter), getter;
    }, __webpack_require__.o = function(object, property) {
        return Object.prototype.hasOwnProperty.call(object, property);
    }, __webpack_require__.p = "", __webpack_require__(__webpack_require__.s = 0);
}([ function(module, exports) {
   function _toConsumableArray(arr) {
   return function(arr) {
   if (Array.isArray(arr)) {
   for (var i = 0, arr2 = new Array(arr.length); i < arr.length; i++) arr2[i] = arr[i];
   return arr2;
   }
   }(arr) || function(iter) {
   if (Symbol.iterator in Object(iter) || "[object Arguments]" === Object.prototype.toString.call(iter)) return Array.from(iter);
   }(arr) || function() {
   throw new TypeError("Invalid attempt to spread non-iterable instance");
   }();
   }
   function _typeof(obj) {
   return (_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(obj) {
           return typeof obj;
           } : function(obj) {
           return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
           })(obj);
   }
   !function() {
   var mraidCache = createMraidCache(), eventListeners = {
   error: [],
   ready: [],
   sizeChange: [],
   stateChange: [],
   exposureChange: [],
   viewableChange: []
   }, amazonHandler = function(type) {
   switch (type) {
   case "browser-test":
   return {
   postMessage: function(args) {
   console.log(args);
   }
   };
   
   case "ios":
   return window.webkit.messageHandlers.amzn_bridge;
   
   case "android":
   return window.amzn_bridge;
   
   default:
   return null;
   }
   }(mraidCache.deviceOS), commandInFlight = !1, commandQueue = [], debugMode = !1;
   function _pushCommand(parcel) {
   commandQueue.push(parcel), commandInFlight || (_postParcel(commandQueue[0]), commandInFlight = !0);
   }
   function _postParcel(parcel) {
   try {
   "android" === mraidCache.deviceOS ? amazonHandler.postMessage(JSON.stringify(parcel)) : "ios" === mraidCache.deviceOS ? amazonHandler.postMessage(parcel) : console.log("Posting parcel: ".concat(JSON.stringify(parcel))),
   commandQueue = commandQueue.filter(function(command, index) {
                                      return 0 !== index;
                                      });
   } catch (e) {
   return void fireError("Problem posting parcel to host");
   }
   }
   function createMraidCache() {
   return {
   version: "3.0",
   deviceOS: function() {
   var iOS = /(iphone|ipod|ipad).*applewebkit.*/g.test(window.navigator.userAgent.toLowerCase()), android = /linux.*android.*/g.test(window.navigator.userAgent.toLowerCase());
   {
   if (iOS) return "ios";
   if (android) return "android";
   }
   return "browser-test";
   }(),
   supports: {
   sms: null,
   tel: null,
   calendar: null,
   storePicture: null,
   inlineVideo: null,
   vpaid: null,
   location: null
   },
   placementType: null,
   currentPosition: null,
   defaultPosition: null,
   currentAppOrientation: null,
   orientationProperties: {
   allowOrientationChange: !0,
   forceOrientation: "portrait"
   },
   state: "loading",
   expandProperties: {
   width: -1,
   height: -1,
   useCustomClose: !1,
   isModal: !0
   },
   maxSize: null,
   screenSize: null,
   resizeProperties: {
   width: -1,
   height: -1,
   offsetX: -1,
   offsetY: -1,
   customClosePosition: "top-right",
   allowOffscreen: !1
   },
   location: null,
   isViewable: !1
   };
   }
   function createParcel(type, subtype, arg) {
   return {
   type: type,
   subtype: subtype,
   arguments: arg
   };
   }
   function checkListeners(event, argsArray) {
   -1 !== Object.keys(eventListeners).indexOf(event) ? eventListeners[event].forEach(function(callback) {
                                                                                     try {
                                                                                     callback.apply(void 0, _toConsumableArray(argsArray));
                                                                                     } catch (e) {
                                                                                     console.error(e), window.mraidBridge.service.logMessage("Error event: ".concat(e));
                                                                                     }
                                                                                     }) : fireError("".concat(event, " is not a valid MRAID event"));
   }
   function validateAndAssign(mraidCacheKey, allowedTypesMap, obj) {
   for (var key in allowedTypesMap) obj.hasOwnProperty(key) && _typeof(obj[key]) !== allowedTypesMap[key] ? fireError("Invalid data type '".concat(key, "': Must be '").concat(allowedTypesMap[key], "'")) : obj.hasOwnProperty(key) && _typeof(obj[key]) === allowedTypesMap[key] && (mraidCache[mraidCacheKey][key] = obj[key]);
   }
   function fireError(errorMessage) {
   window.mraidBridge.service.logMessage("Error event: ".concat(errorMessage)), window.mraidBridge.event.error(errorMessage);
   }
   window.mraid = {
   getVersion: function() {
   return mraidCache.version;
   },
   addEventListener: function(event, func) {
   Array.isArray(eventListeners[event]) ? "function" == typeof func ? eventListeners[event].push(func) : fireError("Function was not provided for event listener") : fireError("".concat(event, " is not a valid MRAID event"));
   },
   removeEventListener: function(event, listener) {
   Array.isArray(eventListeners[event]) && (eventListeners[event] = void 0 !== listener ? eventListeners[event].filter(function(func) {
                                                                                                                       return func !== listener;
                                                                                                                       }) : []);
   },
   open: function(url) {
   void 0 !== url ? "string" == typeof url ? _pushCommand(createParcel("mraid", "open", {
                                                                       url: url
                                                                       })) : fireError("Invalid argument type '".concat(_typeof(url), "': Must be 'string'")) : fireError("URL must be provided for 'open' command");
   },
   close: function() {
   _pushCommand(createParcel("mraid", "close", {}));
   },
   unload: function() {
   _pushCommand(createParcel("mraid", "unload", {}));
   },
   useCustomClose: function(bool) {
   void 0 !== bool ? "boolean" == typeof bool && null !== bool ? (mraidCache.expandProperties.useCustomClose = bool,
                                                                  _pushCommand(createParcel("mraid", "useCustomClose", {
                                                                                            state: mraidCache.expandProperties.useCustomClose
                                                                                            }))) : fireError("Invalid argument type '".concat(_typeof(bool), "': Must be 'boolean'")) : fireError("No argument passed into useCustomClose'");
   },
   expand: function(url) {
   void 0 === url || "string" == typeof url ? _pushCommand(createParcel("mraid", "expand", {
                                                                        url: url,
                                                                        orientation: mraidCache.orientationProperties,
                                                                        position: mraidCache.expandProperties
                                                                        })) : fireError("Invalid argument type '".concat(_typeof(url), "': Must be 'string'"));
   },
   isViewable: function() {
   return mraidCache.isViewable;
   },
   playVideo: function() {
   fireError("playVideo is not yet supported");
   },
   resize: function() {
   -1 === mraidCache.resizeProperties.width && -1 === mraidCache.resizeProperties.height && -1 === mraidCache.resizeProperties.offsetX && -1 === mraidCache.resizeProperties.offsetY && "top-right" === mraidCache.resizeProperties.customClosePosition && !1 === mraidCache.resizeProperties.allowOffscreen && fireError("setResizeProperties must be called with values set prior to resize"),
   _pushCommand(createParcel("mraid", "resize", mraidCache.resizeProperties));
   },
   storePicture: function() {
   fireError("storePicture is not yet supported");
   },
   createCalendarEvent: function() {
   fireError("createCalendarEvent is not yet supported");
   },
   getScreenSize: function() {
   return mraidCache.screenSize;
   },
   getMaxSize: function() {
   return mraidCache.maxSize;
   },
   supports: function(feature) {
   return mraidCache.supports[feature];
   },
   getPlacementType: function() {
   return mraidCache.placementType;
   },
   getOrientationProperties: function() {
   return mraidCache.orientationProperties;
   },
   setOrientationProperties: function(obj) {
   if (void 0 !== obj) if ("object" === _typeof(obj) && null !== obj) {
   validateAndAssign("orientationProperties", {
                     allowOrientationChange: "boolean",
                     forceOrientation: "string"
                     }, obj);
   } else fireError("Invalid argument type '".concat(_typeof(obj), "': Must be 'object'")); else fireError("No argument passed into setOrientationProperties'");
   },
   getCurrentAppOrientation: function() {
   return mraidCache.currentAppOrientation;
   },
   getCurrentPosition: function() {
   return mraidCache.currentPosition;
   },
   getDefaultPosition: function() {
   return mraidCache.defaultPosition;
   },
   getState: function() {
   return mraidCache.state;
   },
   getExpandProperties: function() {
   return mraidCache.expandProperties;
   },
   setExpandProperties: function(obj) {
   if (void 0 !== obj) if ("object" === _typeof(obj) && null !== obj) {
   validateAndAssign("expandProperties", {
                     width: "number",
                     height: "number",
                     useCustomClose: "boolean",
                     isModal: "boolean"
                     }, obj);
   } else fireError("Invalid argument type '".concat(_typeof(obj), "': Must be 'object'")); else fireError("No argument passed into setExpandProperties");
   },
   getResizeProperties: function() {
   return mraidCache.resizeProperties;
   },
   setResizeProperties: function(obj) {
   if (void 0 !== obj) if ("object" === _typeof(obj) && null !== obj) {
   validateAndAssign("resizeProperties", {
                     width: "number",
                     height: "number",
                     offsetX: "number",
                     offsetY: "number",
                     customClosePosition: "string",
                     allowOffscreen: "boolean"
                     }, obj);
   } else fireError("Invalid argument type '".concat(_typeof(obj), "': Must be 'object'")); else fireError("No argument passed into setResizeProperties");
   },
   getLocation: function() {
   return mraidCache.location;
   }
   }, window.mraidBridge = {
   service: {
   logMessage: function(message) {
   var parcel = createParcel("service", "log", {
                             message: message.toString()
                             });
   "android" === mraidCache.deviceOS ? amazonHandler.postMessage(JSON.stringify(parcel)) : "ios" === mraidCache.deviceOS ? amazonHandler.postMessage(parcel) : console.log("LogMessage to host: ".concat(JSON.stringify(parcel)));
   },
   pushCommand: function(parcel) {
   _pushCommand(parcel);
   },
   postParcel: function(parcel) {
   _postParcel(parcel);
   },
   acknowledgement: function(arg) {
   debugMode && this.logMessage("MRAID acknowledgement, ".concat(arg)), commandInFlight = !1,
   0 < commandQueue.length && (_postParcel(commandQueue[0]), commandInFlight = !0);
   },
   debug: function(arg) {
   "string" != typeof arg || "enable" !== arg && "disable" !== arg ? fireError("debug takes a string argument of 'enable' or 'disable'") : debugMode = "enable" === arg;
   },
   mraidState: function() {
   var data = {
   MRAID_ENV: window.MRAID_ENV,
   mraidCache: mraidCache,
   eventListeners: eventListeners,
   commandQueue: commandQueue,
   commandInFlight: commandInFlight,
   debugMode: debugMode
   };
   return console.log(data), this.logMessage(JSON.stringify(data)), data;
   },
   reset: function() {
   mraidCache = createMraidCache(), commandInFlight = !1, commandQueue = [], Object.keys(eventListeners).forEach(function(key) {
                                                                                                                 eventListeners[key] = [];
                                                                                                                 });
   }
   },
   event: {
   error: function(message, action) {
   checkListeners("error", [ message, action ]);
   },
   ready: function() {
   _pushCommand(createParcel("mraid", "jsready", {})), checkListeners("ready", []);
   },
   sizeChange: function(width, height) {
   checkListeners("sizeChange", [ width, height ]);
   },
   stateChange: function(state) {
   checkListeners("stateChange", [ mraidCache.state = state ]);
   },
   exposureChange: function(exposedPercentage, visibleRectangle, occlusionRectangles) {
   checkListeners("exposureChange", [ exposedPercentage, visibleRectangle, occlusionRectangles ]);
   },
   viewableChange: function(boolean) {
   checkListeners("viewableChange", [ mraidCache.isViewable = boolean ]);
   }
   },
   property: {
   setCurrentPosition: function(obj) {
   mraidCache.currentPosition = obj;
   },
   setScreenSize: function(obj) {
   mraidCache.screenSize = obj;
   },
   setMaxSize: function(obj) {
   mraidCache.maxSize = obj;
   },
   setCurrentAppOrientation: function(obj) {
   mraidCache.currentAppOrientation = obj;
   },
   setSupports: function(obj) {
   mraidCache.supports = obj;
   },
   setPlacementType: function(obj) {
   mraidCache.placementType = obj.type;
   },
   setDefaultPosition: function(obj) {
   mraidCache.defaultPosition = obj;
   },
   setResizeProperties: function(obj) {
   mraidCache.resizeProperties = obj;
   },
   setLocation: function(obj) {
   mraidCache.location = obj;
   }
   }
   };
   }();
   } ]);

