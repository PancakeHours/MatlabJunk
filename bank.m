function [pointsEarned, remainingArray] = bank(comboNum,inputArray)
        maxIndicesLength = 0;
        pairCount = 0;
        tempArray = inputArray;
        maxIndices = [];
        switch(comboNum)
            case 1
                indices = find(inputArray == 1);
                if(length(indices) > 0)
                    pointsEarned = 100;
                    tempArray(indices(1)) = [];
                    remainingArray = tempArray;
                else
                    remainingArray = inputArray;
                    
                    pointsEarned = 0;
                end
            case 2
                indices = find(inputArray == 5);
                if(length(indices) > 0)
                    tempArray(indices(1)) = [];
                    remainingArray = tempArray;
                    pointsEarned = 50;
                else
                    remainingArray = inputArray;
                    pointsEarned = 0;
                end
            case 3
                indices = find(inputArray == 1);
                if(length(indices) > 2)
                    tempArray(indices(1:3)) = [];
                    remainingArray = tempArray;
                    pointsEarned = 1000;
                else
                    remainingArray = inputArray;
                    pointsEarned = 0;
                end
            case 4
                indices = find(inputArray == 2);
                if(length(indices) > 2)
                    tempArray(indices(1:3)) = [];
                    remainingArray = tempArray;
                    pointsEarned = 200;
                else
                    remainingArray = inputArray;
                    pointsEarned = 0;
                end
            case 5
                indices = find(inputArray == 3);
                if(length(indices) > 2)
                    tempArray(indices(1:3)) = [];
                    remainingArray = tempArray;
                    pointsEarned = 300;
                else
                    remainingArray = inputArray;
                    pointsEarned = 0;
                end
            case 6
                indices = find(inputArray == 4);
                if(length(indices) > 2)
                    tempArray(indices(1:3)) = [];
                    remainingArray = tempArray;
                    pointsEarned = 400;
                else
                    remainingArray = inputArray;
                    pointsEarned = 0;
                end
            case 7
                indices = find(inputArray == 5);
                if(length(indices) > 2)
                    tempArray(indices(1:3)) = [];
                    remainingArray = tempArray;
                    pointsEarned = 500;
                else
                    remainingArray = inputArray;
                    pointsEarned = 0;
                end
            case 8
                indices = find(inputArray == 6);
                if(length(indices) > 2)
                    tempArray(indices(1:3)) = [];
                    remainingArray = tempArray;
                    pointsEarned = 600;
                else
                    remainingArray = inputArray;
                    pointsEarned = 0;
                end
            case 9
                for x = 1:6
                    indices = find(inputArray == x);
                    if(length(indices) > maxIndicesLength)
                        maxIndicesLength = length(indices);
                        maxIndices = indices;
                    end
                end
                if(maxIndicesLength > 3)
                    tempArray(maxIndices(1:4)) = [];
                    remainingArray = tempArray;
                    pointsEarned = 1000;
                else
                    remainingArray = inputArray;
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
                    tempArray(maxIndices(1:5)) = [];
                    remainingArray = tempArray;
                    pointsEarned = 2000;
                else
                    remainingArray = inputArray;
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
                    remainingArray = [];
                    pointsEarned = 3000;
                else
                    remainingArray = inputArray;
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
                    remainingArray = [];
                    pointsEarned = 1500;
                else
                    remainingArray = inputArray;
                    pointsEarned = 0;
                end
            case 13
                if(length(unique(inputArray)) == length(inputArray))
                    remainingArray = [];
                    pointsEarned = 2500;
                else
                    remainingArray = inputArray;
                    pointsEarned = 0;
                end
            otherwise
                fprintf('Invalid combo!');
                remainingArray = inputArray;
                pointsEarned = 0;

        end
        fprintf('Points added: %d\n',pointsEarned);
    end