
var test = `
test
test2
   test3
        test25
`

/\r?\n|\r/g

function Remove-WhiteSpace ({$String}) {
    return $String.replace(/\r?\n|\r|\s|\t/g, "");
}

RemoveWhiteSpace({$String: test})


let withoutnewline = test.replace(/\r?\n|\r|\s|\t/g, "");