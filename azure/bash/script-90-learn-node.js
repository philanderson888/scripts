import ps from 'ps-node';	 
import psList from 'ps-list';
import process from 'node';
import { platform } from 'node:process';
import os from 'node:os';
import processList from 'ps-list';


console.log('==================================================')
console.log('====           node hello world               ====')
console.log('==================================================')
console.log('hello world from the amazing world of js');

console.log('==================================================')
console.log('====          array for each                  ====')
console.log('==================================================')
const myArray = [1, 2, 3];
myArray.forEach( (item) => {
    console.log(item);
});


console.log('==================================================')
console.log('====              fetch get                   ====')
console.log('==================================================')
fetch('https://jsonplaceholder.typicode.com/todos/1')
      .then(response => response.json())
      .then(json => console.log(json))



console.log('==================================================')
console.log('====              fetch post                  ====')
console.log('==================================================')      
fetch('https://jsonplaceholder.typicode.com/posts', {
  method: 'POST',
  body: JSON.stringify({
    title: 'foo',
    body: 'bar',
    userId: 1,
  }),
  headers: {
    'Content-type': 'application/json; charset=UTF-8',
  },
})
  .then((response) => response.json())
  .then((json) => console.log(json));







console.log('==================================================')
console.log('====               fetch put                  ====')
console.log('==================================================')  
fetch('https://jsonplaceholder.typicode.com/posts/1', {
  method: 'PUT',
  body: JSON.stringify({
    id: 1,
    title: 'foo',
    body: 'bar',
    userId: 1,
  }),
  headers: {
    'Content-type': 'application/json; charset=UTF-8',
  },
})
  .then((response) => response.json())
  .then((json) => console.log(json));







console.log('=======================================================')
console.log('====                loops                          ====')
console.log('====                every                          ====')
console.log('====              for .. of                        ====')
console.log('=======================================================')
console.log('==================================================')
console.log('====          loop - every                    ====')
console.log('==================================================')
const myEveryArray = [1,2,3]
const everyArrayBreakNumber = 3;
myEveryArray.every(function(item) {
    if (item > everyArrayBreakNumber) {
        console.log(`item is greater than ${everyArrayBreakNumber} so breaking`)
        return false
    }
    console.log(item);
    return true;    
});



console.log('==================================================')
console.log('====         loop for ... of                  ====')
console.log('==================================================')
const myLoopArray = [1, 2, 3];
for (const item of myLoopArray) {
  console.log(item);
  if (item === 3) {
    break;
  }
}


console.log('==================================================')
console.log('====      loop for ... of ... entries         ====')
console.log('==================================================')
const myLoopArrayWithEntries = [0, 1, 2];
for (const [index,item] of myLoopArrayWithEntries.entries()) {
  console.log(`index ${index} is item ${item}`);
  if (index > 2) {
    break;
  }
}




console.log('==================================================')
console.log('====         operating system os              ====')
console.log('==================================================')

console.log(`operating system architecture is ${os.arch()}`)
console.log(`operating system cpu cores are as listed here`);
console.log(os.cpus())
console.log(`operating system platform is ${os.platform()}`)


console.log('==================================================')
console.log('====               platform                    ====')
console.log('==================================================')
console.log(`the operating system platform is ${platform}`);




console.log('==================================================')
console.log('====            process using process         ====')
console.log('==================================================')
console.log(process.versions);
console.log('node platform ' + process.platform);
console.log('node environment variables');
console.log(process.env);






console.log('==================================================')
console.log('====            process using ps-list         ====')
console.log('==================================================')
processList().then(data => {
    console.log(data);
    //=> [{pid: 3213, name: 'node', cmd: 'node test.js', cpu: '0.1'}, ...] 
});
processList()






console.log('==================================================')
console.log('====          process using ps                ====')
console.log('==================================================')
ps.lookup({ 
  command: 'node',
  arguments: '--debug',
}, (err, resultList ) => {
  if (err) {
    throw new Error( err );
  }
  resultList.forEach(function( process ){
    if( process ){
        console.log( 'PID: %s, COMMAND: %s, ARGUMENTS: %s', process.pid, process.command, process.arguments );
    }
  });
});



console.log('==================================================')
console.log('====               ps-list                    ====')
console.log('====         list all process ...             ====')
console.log('====      in this case break early ...        ====')
console.log('==================================================')

const runningProcesses = await processList()

let testProcessId = 0;

for (const process of runningProcesses) {
    console.log(process)

    testProcessId = process.pid;

    if (process.pid > 1) {
        break;
    }
}

runningProcesses()

console.log('==================================================')
console.log('====             ps-node v1                   ====')
console.log('==================================================')
ps.lookup({
    command: 'node',
    arguments: '--debug',
    }, function(err, resultList ) {
    if (err) {
        throw new Error( err );
    }
    resultList.forEach(function( process ){
        console.log(process.pid);
        if( process ){
            console.log( 'PID: %s, COMMAND: %s, ARGUMENTS: %s', process.pid, process.command, process.arguments );
        }
    });
});
console.log('==================================================')
console.log('====             ps-node v2                   ====')
console.log('==================================================')
ps.lookup({ testProcessId }, function (err, resultList) {
    if (err) {
      throw new Error(err);
    }
    const process = resultList[0];
    if (process) {
      console.log(JSON.stringify(process));
    }
    else {
      console.log(JSON.stringify({}));
    }
  });

