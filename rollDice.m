function diceArray = rollDice(numDice)
    for x = 1:numDice
        diceArray(x) = randi(6);
    end
    fprintf('%d ',diceArray);
    fprintf('\n');
end