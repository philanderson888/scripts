import ps from 'ps-node';	 
import psList from 'ps-list';
console.log('==================================================')
console.log('====           node hello world               ====')
console.log('==================================================')
console.log('hello world from the amazing world of js');

console.log('==================================================')
console.log('====          array for each                  ====')
console.log('==================================================')
const myArray = [ 1, 2, 3];
myArray.forEach( (item) => {
    console.log(item);
});

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
console.log('====               ps-list                    ====')
console.log('====         list all process ...             ====')
console.log('====      in this case break early ...        ====')
console.log('==================================================')
for (const process of psList()) {
    console.log(process)
    if (process.pid > 1) {
        break;
    }
}

console.log('==================================================')
console.log('====               ps-node                    ====')
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
