function [] = getInput(app)
    
    switch(app.CurrentPromptEditField.Value)
        case("Please enter a name for player 1.")
            player1 = player(app.PlayerEntryEditField.Value,0,true);
        case("Please enter a name for player 2.")
            player2 = player(app.PlayerEntryEditField.Value,0,true);
    end
    
end