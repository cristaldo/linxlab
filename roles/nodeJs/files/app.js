
// Aplicação sobe uma instância filho (worker) por processador. Caso um worker caia, ele sobre outro processo.

var numCPUs = require('os').cpus().length;
var cluster = require('cluster'), os = require('os');
var express = require('express');
var app = express();

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

	app.get('/', function (req, res) {
  		res.send(`Hello World Linx !!! Sou o worker ${cluster.worker.id} de ${numCPUs} CPUs\n`);
		});

	app.listen(3000, function () {
		console.log('Example app listening on port 3000!');
		});

}
