def throw_die():
    import random
    return random.randint(1,6)

money = 100
startMoney = money
n = 4
win = 0.0
j = 0.0
while money > 0:
    j += 1
    money -= 1 
    total = 0    
    for i in range(n):
        total += throw_die()
    if total < 9:
        win += 1
        money += 10
    if j == 1000:
        break

print "you started with ${0}, after rolling {1} dice {2} times you won {3} many times   and now have ${4}!   ".format ((startMoney),(n),(j),(win),(money))

# should you play this game?

# my answer to this question is NO!.. if yu lower the amount of dice used
#then yes it will be  a fair game,
#but using four dice is not a good idea if you are looking to make profit.
