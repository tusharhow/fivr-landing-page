'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "1f5bf0f705ca6d4f900d6250547d92db",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/icons/health.svg": "1f1cee2436880483b2246835823ed7f1",
"assets/assets/icons/box.svg": "28db49955c45c281e991e18ada2ac400",
"assets/assets/icons/left_arrow.svg": "1c4d46ad3d25cf68666c1515ba106dfd",
"assets/assets/icons/right_arrow.svg": "d7d17ec30b188b3a2ce1e4a84d6f5054",
"assets/assets/icons/education.svg": "09cec3b7fcc3912500e8b5194ea2c46f",
"assets/assets/icons/finance.svg": "003d1e6d02a597659b19a8b497c39e03",
"assets/assets/vectors/segment%2520logo%2520small.svg": "41dba953ffa43e14a998fe48c171e635",
"assets/assets/vectors/instagram.svg": "89459860d91476004dc54d6d3dc63622",
"assets/assets/vectors/fackbook.svg": "6b87388f12e1ea17e1672e0859d126e6",
"assets/assets/vectors/linkedin.svg": "6f80518616005d79eaa4c3a1d9f70c82",
"assets/assets/vectors/telegram.svg": "bb92f7f174967d8daf19baf781193539",
"assets/assets/vectors/pixijs.svg": "6f08331903c5a4fc9797b041f2d0f433",
"assets/assets/vectors/FivR.svg": "5e52178d7780ee26e4ef8d7791d06660",
"assets/assets/vectors/netflix.svg": "ff547625006275d11f0eceaf07015ab1",
"assets/assets/vectors/youtube.svg": "660462ac933edcbf5d702a48c5adc110",
"assets/assets/images/img2.png": "da2e9a909d422c0850ab500873f7908f",
"assets/assets/images/user2.png": "d27b3b18eb62988902ded3909ca91e11",
"assets/assets/images/user3.png": "2cb5d08d9b72bb8cc3382c89ed86e2ec",
"assets/assets/images/facebook.png": "21ee23e4acb42aa4fcb8b7794419d8d4",
"assets/assets/images/pixijs.png": "1d8d8c07c42133e6b344da6876483b5d",
"assets/assets/images/segment%2520logo%2520small.png": "599163cc9ea430b7711c350e74328ea6",
"assets/assets/images/pixiJS-BG.png": "f00211e8ab0b30dc0035f18914658b45",
"assets/assets/images/telegram.png": "c90624f5b1e8b86cbad44b45c6dc6d03",
"assets/assets/images/youtube.png": "78bbc27d98e92a76507f1ba4dd9f3ae2",
"assets/assets/images/FivR.png": "ffa1a9e372d801ea1e513bff2d8d974a",
"assets/assets/images/linkedin.png": "2c3a03e1691ccdeae48d6619941158ff",
"assets/assets/images/ham%2520burger.png": "0db499b08b9c401510e45ecc5258dbd3",
"assets/assets/images/img1.png": "b44376685886edaeb58ae8b9a8733366",
"assets/assets/images/finance.png": "c389bd7317f6c90ead9727d23e66d440",
"assets/assets/images/road.png": "837935476f164d1ad57e23382bb7d38f",
"assets/assets/images/eye.png": "d262938b81a5ea93030ba24c1bec5d1e",
"assets/assets/images/img3.png": "6d61837cf19459568eb0c01c0b8aa978",
"assets/assets/images/instagram.png": "f000a286e735e0ee664fca5accfd4bd6",
"assets/assets/images/user1.png": "35593dcd3781754914e3d0b6ab8665c9",
"assets/assets/images/netflix.png": "8d4207477f566c39180c85e64c8e7870",
"assets/assets/images/mosque.png": "47d9b1369db3462ec18d58ba94a5212a",
"assets/assets/images/user4.png": "7fc9b43a7c1513487d07b4d04667da81",
"assets/fonts/MaterialIcons-Regular.otf": "67834fe70ffc9d941c2df0a13425cac7",
"assets/AssetManifest.bin": "242795a734fe9695194aec807ba93590",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.json": "e19c68f282991afe716d8a71edb9b783",
"assets/NOTICES": "d4dd3ba347746fe24974297aa1a3dc74",
"index.html": "4c2c4fd94984aef0138a428e879cf2b8",
"/": "4c2c4fd94984aef0138a428e879cf2b8",
"main.dart.js": "dc9788578e7f16afecca6dc44bf01f3f",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "22248edf1c6ef20ed9ae19bb4d8359c8",
"flutter_bootstrap.js": "3a1420103fe3d421ed43ad62ae2375fc",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"manifest.json": "3d48bfbab713e7a15f1292cf6a0fe508",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
