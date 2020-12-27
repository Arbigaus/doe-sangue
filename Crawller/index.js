
const { Worker, isMainThread, parentPort }  = require('worker_threads');
const fs = require('fs');
const admin = require("firebase-admin");

if (isMainThread) {
  const worker =  new Worker(__filename);
  worker.once('message', (message) => {
    console.log(message); // prints 'Worker thread: Hello!'
  });

  let jsonData = fs.readFileSync('list.json');
  let data = JSON.parse(jsonData)

  let states = data.estados.map(item => item.estados).flat()

  let unidades = states.map(item => item.unidades).flat()

  let unities = unidades.map(unidade => {
    let br = new RegExp('<br>', 'g');
    let br2 = new RegExp('</br>', 'g');
    let tel = unidade.tel.replace(br, '|').replace(br2, '|')

    var unit = {}

    // let latLongReg = new RegExp('(?:(@))', 'g');
    let latLong = unidade.map.match(/(?:(@)).*/g);

    if (latLong) {
      let latLongArr = latLong[0].replace('@', '').replace(/(?:(z\/)).*/g, '').split(',');
      console.log(latLongArr)
      let lat = latLongArr[0]
      let long = latLongArr[1]

      unit = {
        title: unidade.title,
        address: unidade.the_content,
        map: unidade.map,
        phone: tel,
        zipAddress: unidade.cep,
        lat,
        long
      }
    } else {
      unit = {
        title: unidade.title,
        address: unidade.the_content,
        map: unidade.map,
        phone: tel,
        zipAddress: unidade.cep,
      }
    }

    return unit
  })

  admin.initializeApp({
    credential: admin.credential.cert(require('./firebaseKey.json'))
  });
  let db = admin.firestore();

  unities.forEach(item => {
    db.collection('BloodLocations').doc().set({...item})
      .then(() => {
      console.log(item.title + " saved!")
    })
      .catch((err => {
       console.log(err.message)
    }))
  })
}
