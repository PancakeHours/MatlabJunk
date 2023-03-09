classdef player
   
    properties
        points = 0;
        isThisPlayerTurn = false;
        name
    end

    methods
        function obj = player(playerName,startingPoints,startingTurn)
            obj.points = startingPoints;
            obj.isThisPlayerTurn = startingTurn;
            obj.name = playerName;
        end
        
        function returnName = getName(obj)
            returnName = obj.name;
        end

        function obj = addPoints(obj,pointsAdded)
            obj.points = obj.points + pointsAdded;
        end

        function obj = setPoints(obj,pointsSet)
            obj.points = pointsSet;
        end

        function returnPoints = getPoints(obj)
            returnPoints = obj.points;
        end

        function obj = setTurn(obj,turn)
            obj.isThisPlayerTurn = turn;
        end
        
        function isPlayerTurn = isTurn(obj)
            isPlayerTurn = obj.isThisPlayerTurn;
        end
          
    end
end
