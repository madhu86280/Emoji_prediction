filename = "weekendUpdates.xlsx";
tbl = readtable(filename,'TextType','string');
head(tbl)
str = tbl.TextData;
documents = tokenizedDocument(str);
documents(1:5)
compoundScores = vaderSentimentScores(documents);
idx = compoundScores > 0;
strPositive = str(idx);
strNegative = str(~idx);

figure
subplot(1,2,1)
wordcloud(strPositive);
title("Positive Sentiment")

subplot(1,2,2)
wordcloud(strNegative);
title("Negative Sentiment")

emoji = compose("\xD83D\xDE0E");
idx = contains(strPositive,emoji);
textDataSunglasses = strPositive(idx);
textDataSunglasses(1:5)
documents = tokenizedDocument(strPositive);
tdetails = tokenDetails(documents);
head(tdetails)
idx = tdetails.Type == "emoji";
tokens = tdetails.Token(idx);
figure
wordcloud(tokens);
title("Happy Emojis")

emoji = compose("\xD83D\xDE0E");
idx = contains(strNegative,emoji);
textDataSunglasses = strNegative(idx);

documents = tokenizedDocument(strNegative);
tdetails = tokenDetails(documents);
head(tdetails)
idx = tdetails.Type == "emoji";
tokens = tdetails.Token(idx);
figure
wordcloud(tokens);
title("SAD Emojis")
