'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"index.html": "b4e3e2d50e5f1ac9860c4444d2b26cbd",
"/": "b4e3e2d50e5f1ac9860c4444d2b26cbd",
"main.dart.js": "5286ad2253999252ae389dc8b4a94e0e",
"manifest.json": "ae099ba09ec5c5a42877d1c12bbe814d",
"version.json": "95d5a51bd2746244136aef330c7cd7c4",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/ms-icon-310x310.png": "d8970dd71a945a50b1efdd6b468fe546",
"icons/android-icon-36x36.png": "30463a414fbbaf9df858a3ce7fd2c170",
"icons/apple-icon-76x76.png": "2f7ce39f28e22b4cc6a51ae66628dafe",
"icons/android-icon-144x144.png": "fbff0fffdbef2ce2cd8f34daef7ad2ad",
"icons/apple-icon-60x60.png": "a55aff14430cd223536eb309209f5c71",
"icons/favicon-32x32.png": "0a06a68d7f58049e1b27f3145f9115fd",
"icons/ms-icon-150x150.png": "cad5e4fc8d48d494adadeb3be05948d5",
"icons/favicon-16x16.png": "531ce70d0234949ab221b0134a03667b",
"icons/apple-icon-180x180.png": "6dcc7c97ce51703ce59ee1ecca3c328c",
"icons/apple-icon.png": "b7190662876c6721b6557b3d46ab8458",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/android-icon-48x48.png": "4d3d46aa04f1484803965839205cd5f1",
"icons/ms-icon-70x70.png": "04a804c39e297c21ee4d9c3270939008",
"icons/apple-icon-precomposed.png": "b7190662876c6721b6557b3d46ab8458",
"icons/apple-icon-152x152.png": "a98bfd2d04140e21b333d32e578b0655",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/favicon-96x96.png": "89623614ab625f970dee813deadfd3b6",
"icons/android-icon-96x96.png": "95eebc4fc9cc035db2e9e9a1612f9b17",
"icons/Double%20Ring-1s-200px.gif": "a0ad288e567079383b66804a374501c9",
"icons/favicon.ico": "2c418fda0701f23d4ca19fd94070842f",
"icons/ms-icon-144x144.png": "519f151bf6dfc6de2bf3e43ed8af77da",
"icons/apple-icon-57x57.png": "7c4b719a5ba0f1c085ba54658a9a3ddf",
"icons/android-icon-72x72.png": "0257fd1aee038a0b99758523fbfe1d76",
"icons/android-icon-192x192.png": "5afb770fe294ce03e3338ce5057a28ee",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/apple-icon-72x72.png": "0257fd1aee038a0b99758523fbfe1d76",
"icons/apple-icon-120x120.png": "a0f4a5260057476831b69cc511f19809",
"icons/Double%20Ring-1s-200px.png": "0c5cd83939d79e62187238ec5e4cc670",
"icons/apple-icon-144x144.png": "519f151bf6dfc6de2bf3e43ed8af77da",
"icons/apple-icon-114x114.png": "071d2bbe8e81be0e008958a5b8ce2d86",
"favicon.ico": "2c418fda0701f23d4ca19fd94070842f",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/NOTICES": "4f9d9eee22ab0acf76d9eebe4a799f86",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/AssetManifest.json": "e26ab0f0a9ebee8025260de29a88a4ca",
"styles.css": "2d24d2153c317cb9a95b1d46ca884711"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
