function bool = isFarkle(data)
    maxIndicesLength = 0;
    pairCount = 0;
    bool = true;

    indices = find(data == 1);
    if(length(indices) > 0)
        bool = false;
    end

    indices = find(data == 5);
    if(length(indices) > 0)
        bool = false;
    end

    indices = find(data == 1);
    if(length(indices) > 2)
        bool = false;
    end

    indices = find(data == 2);
    if(length(indices) > 2)
        bool = false;
    end

    indices = find(data == 3);
    if(length(indices) > 2)
        bool = false;
    end

    indices = find(data == 4);
    if(length(indices) > 2)
        bool = false;
    end

    indices = find(data == 5);
    if(length(indices) > 2)
        bool = false;
    end

    indices = find(data == 6);
    if(length(indices) > 2)
        bool = false;
    end

    for x = 1:6
        indices = find(data == x);
        if(length(indices) > maxIndicesLength)
            maxIndicesLength = length(indices);
        end
    end

    if(maxIndicesLength > 3)
        bool = false;
    end

    for x = 1:6
        indices = find(data == x);
        if(length(indices) > maxIndicesLength)
            maxIndicesLength = length(indices);
        end
    end
    if(maxIndicesLength > 4)
        bool = false;
    end

    for x = 1:6
        indices = find(data == x);
        if(length(indices) > maxIndicesLength)
            maxIndicesLength = length(indices);
        end
    end
    if(maxIndicesLength > 5)
        bool = false;
    end

    for x = 1:6
        indices = find(data == x);
        if(length(indices) == 2)
            pairCount = pairCount + 1;
        end
        if(length(indices) == 4)
            pairCount = pairCount + 2;
        end
    end
    if(pairCount == 3)
        bool = false;
    end

    if(length(unique(data)) == length(data))
        bool = false;
    end

    
end
            