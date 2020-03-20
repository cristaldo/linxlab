
//const cluster = require('cluster');
var numCPUs = require('os').cpus().length;
var http = require('http');
var express = require('express');
var app = express();
var cluster = require('cluster'), os = require('os');

   if (cluster.isMaster) {
  	console.log('Master process is running');
	for (let i = 0; i < numCPUs; i++) {
		cluster.fork();
		}

	cluster.on('listening', function(worker) {
		console.log('Cluster %d esta conectado.', worker.process.pid);
	});

	cluster.on('disconnect', function(worker) {
		console.log('Cluster %d esta desconectado.', worker.process.pid);
	});

	cluster.on('exit', (worker, code, signal) => {
		console.log(`Worker ${worker.process.pid} caiu fora with code: ${code}, and signal: ${signal}`);
    		console.log('Iniciando novo worker');
    		cluster.fork();
	});

 } else {

 	http.createServer((req, res) => {
		res.writeHead(200);
   		res.end(`Hello World Lynx ! I am the worker ${cluster.worker.id}\n`);
        }).listen(3000);

	console.log('Example app listening on port 3000!');

}
