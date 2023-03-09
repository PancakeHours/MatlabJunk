import dicegame.*

player1 = player(input("Please enter a name for player 1:", "s"),0,true);
player2 = player(input("Please enter a name for player 2:", "s"),0,false);

currentDiceArray = [];
indices = [];
maxIndicesLength = 0;
pairCount = 0;
rerollCount = 0;
targetPoints = 100;
currentPlayer = player1;

while true

    currentDiceArray = [];
    indices = [];
    maxIndicesLength = 0;
    pairCount = 0;
    rerollCount = 0;
    
    fprintf('It is currently %s''s turn.\n',getName(currentPlayer));
    input("Press any key to roll dice.", "s");
    while rerollCount < 2
        currentDiceArray = RollDice(6);
        userSelection = input("What would you like to do? C/R:","s");
        if(strcmp(userSelection,'C') == true)
            currentPlayer = addPoints(currentPlayer,EvaluateCombo(input("What combo would you like to bank?"),currentDiceArray));
            break
        elseif(strcmp(userSelection,'R') == true)
            if(rerollCount < 1)
                fprintf('A reroll will be performed.\n');
            else
                fprintf('Reroll limit reached! Turn will be passed to next player.\n');
                break
            end
            rerollCount = rerollCount + 1;
        else
            fprintf('Invalid request. A turnover will be performed.\n');
            break
        end
    end

    if(getPoints(currentPlayer) >= targetPoints)
        fprintf('%s has won the game! They ended with %d points.', getName(currentPlayer),getPoints(currentPlayer));
        break
    end
    [player1,player2,currentPlayer] = swapTurns(player1,player2,currentPlayer);

end

function [p1,p2,newCPlayer] = swapTurns(playerOne, playerTwo, cPlayer)
    
    fprintf('Turn over. %s has %d points.\n', getName(cPlayer),getPoints(cPlayer));
    if(isTurn(playerOne))
        playerOne = cPlayer;
        newCPlayer = playerTwo;
    else
        playerTwo = cPlayer;
        newCPlayer = playerOne;
    end
    p1 = setTurn(playerOne, ~playerOne.isTurn());
    p2 = setTurn(playerTwo, ~playerTwo.isTurn());
    
end

function diceArray = RollDice(numDice)
    for x = 1:numDice
        diceArray(x) = randi(6);
    end
    fprintf('%d ',diceArray);
    fprintf('\n');
end

function pointsEarned = EvaluateCombo(comboNum,inputArray)
    maxIndicesLength = 0;
    switch(comboNum)
        case 1
            indices = find(inputArray == 1);
            if(length(indices) > 0)
                pointsEarned = 100;
            else
                pointsEarned = 0;
            end
        case 2
            indices = find(inputArray == 5);
            if(length(indices) > 0)
                pointsEarned = 50;
            else
                pointsEarned = 0;
            end
        case 3
            indices = find(inputArray == 1);
            if(length(indices) > 2)
                pointsEarned = 1000;
            else
                pointsEarned = 0;
            end
        case 4
            indices = find(inputArray == 2);
            if(length(indices) > 2)
                pointsEarned = 200;
            else
                pointsEarned = 0;
            end
        case 5
            indices = find(inputArray == 3);
            if(length(indices) > 2)
                pointsEarned = 300;
            else
                pointsEarned = 0;
            end
        case 6
            indices = find(inputArray == 4);
            if(length(indices) > 2)
                pointsEarned = 400;
            else
                pointsEarned = 0;
            end
        case 7
            indices = find(inputArray == 5);
            if(length(indices) > 2)
                pointsEarned = 500;
            else
                pointsEarned = 0;
            end
        case 8
            indices = find(inputArray == 6);
            if(length(indices) > 2)
                pointsEarned = 600;
            else
                pointsEarned = 0;
            end
        case 9
            for x = 1:6
                indices = find(inputArray == x);
                if(length(indices) > maxIndicesLength)
                    maxIndicesLength = length(indices);
                end
            end
            if(maxIndicesLength > 3)
                pointsEarned = 1000;
            else
                pointsEarned = 0;
            end
        case 10
            for x = 1:6
                indices = find(inputArray == x);
                if(length(indices) > maxIndicesLength)
                    maxIndicesLength = length(indices);
                end
            end
            if(maxIndicesLength > 4)
                pointsEarned = 2000;
            else
                pointsEarned = 0;
            end
        case 11
            for x = 1:6
                indices = find(inputArray == x);
                if(length(indices) > maxIndicesLength)
                    maxIndicesLength = length(indices);
                end
            end
            if(maxIndicesLength > 5)
                pointsEarned = 3000;
            else
                pointsEarned = 0;
            end
        case 12
            for x = 1:6
                indices = find(inputArray == x);
                if(length(indices) == 2)
                    pairCount = pairCount + 1;
                end
                if(length(indices) == 4)
                    pairCount = pairCount + 2;
                end
            end
            if(pairCount == 3)
                pointsEarned = 1500;
            else
                pointsEarned = 0;
            end
        case 13
            if(unique(inputArray).length == inputArray.length)
                pointsEarned = 2500;
            else
                pointsEarned = 0;
            end
        otherwise
            fprintf('Invalid combo!');
            pointsEarned = 0;
    end
    fprintf('Points added: %d\n',pointsEarned);
end


                  