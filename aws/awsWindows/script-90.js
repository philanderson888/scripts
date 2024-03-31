const ps = import('ps-node');	 
const psList = import('ps-list');

console.log('hello world from the amazing world of js');

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


console.log('==================================================')
console.log('====               ps-list                    ====')
console.log('==================================================')



psList().then(data => {
    console.log(data);
    //=> [{pid: 3213, name: 'node', cmd: 'node test.js', cpu: '0.1'}, ...] 
});
