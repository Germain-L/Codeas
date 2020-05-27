var fs = require("fs");

require("firebase/auth");
const fbadmin = require("firebase-admin");

const fbServiceAccountKey = require("./config/firebase_service_account_key.json");

const config = require("./config/config.json");

// Firebase
fbadmin.initializeApp({
  credential: fbadmin.credential.cert(fbServiceAccountKey),
  databaseURL: config.databaseURL,
});

var coll = fbadmin.firestore().collection(config.collectionName);

var txts = [
  "algorithm.txt",
  "classes.txt",
  "data structures.txt",
  "file.txt",
  "graphical.txt",
  "text.txt",
  "web.txt",
  "db.txt",
  "graph.txt",
  "network.txt",
  "numbers.txt",
  "security.txt",
  "threading.txt",
];


fs.readFile(config.filepathToParse, "utf8", function (err, contents) {
  var lines = contents.split("\n");

  lines.forEach((val) => {
    var props = val.split(" - ");
    var toAdd = {};
    toAdd[config.nameFieldName] = props[0];
    toAdd[config.descriptionFieldName] = props[1];

    coll
      .add(toAdd)
      .then((ref) => {
        console.log(ref);
      })
      .catch((err) => {
        console.log(err);
      });
  });
});
