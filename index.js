'use strict';

const express = require('express');

const app = express();
const AWS = require('aws-sdk');
require('dotenv').config()

AWS.config.update({accessKeyId: process.env.accessKeyId, secretAccessKey: process.env.secretAccessKey, region: 'eu-central-1'});
const s3 = new AWS.S3();
const port = 8080;
const address = "0.0.0.0"
let objects = {};
var params = { 
  Bucket: 'tier-object-store' 
}

s3.listObjects(params, function (err, data) {
  if(err)throw err;
  objects = data;
});

app.get('/getObjects', (req, res) => {
  res.send(objects);
});

app.get('/', (req, res) => {
  res.send("App is Ready!");
});

app.listen(port, address);
console.log(`Running on ${address}:${port}`);
