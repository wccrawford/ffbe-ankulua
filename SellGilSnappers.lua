DIR = 'SellGilSnappers'

bluesnapper = Pattern(DIR .. '/BlueSnapper.png')
goldsnapper = Pattern(DIR .. '/BlueSnapper.png')
snapperfamily = Pattern(DIR .. '/SnapperFamily.png')
okbutton = Pattern(DIR .. '/OkButton.png')
yesbutton = Pattern(DIR .. '/YesButton.png')
sellbutton = Pattern(DIR .. '/SellButton.png')
forsale = Pattern(DIR .. '/ForSale.png')
nounits = Pattern(DIR .. '/NoUnits.png')
unitssoldfor = Pattern(DIR .. '/UnitsSoldFor.png')

screenheight = 1280
screenwidth = 720
middleLeft = Location(50, screenheight / 2)
middleRight = Location(screenwidth - 50, screenheight / 2)
bottomRegion = Region(0, 780, 720, 500)
bottomLeftRegion = Region(0, 780, 360, 500)
bottomMiddleRegion = Region(240, 780, 240, 500)
middleRegion = Region(0, 400, 720, 480)
topRegion = Region(0, 0, 720, 400)

sellRegion = Region(0, 330, 720, 610)

found = false

while true do
    if (found == false) then
        bluepairs = regionFindAllNoFindException(sellRegion, bluesnapper);
        for i, m in ipairs(bluepairs) do
            click(m)
            found = true
        end
    end

    if (found == false) then
        goldpairs = regionFindAllNoFindException(sellRegion, goldsnapper);
        for i, m in ipairs(goldpairs) do
            click(m)
            found = true
        end
    end

    if (found == false) then
        sfpairs = regionFindAllNoFindException(sellRegion, snapperfamily);
        for i, m in ipairs(sfpairs) do
            click(m)
            found = true
        end
    end

--    pairs = regionFindAllNoFindException(sellRegion, forsale);
--    for i, m in ipairs(pairs) do
--        click(m)
--        found = true
--    end

    if (found == true) and bottomRegion:exists(sellbutton) then
        click(bottomRegion:getLastMatch())
        wait(1)
        found = false
    end

    if exists(yesbutton) then
        click(getLastMatch())
        wait(1)
    end

--    if exists(okbutton, 2) then
--        click(getLastMatch())
--        wait(1)
--    end
    if middleRegion:exists(nounits) then
        middleRegion:click(okbutton)
        wait(1)
    end

    if middleRegion:exists(unitssoldfor) then
        middleRegion:click(okbutton)
        wait(1)
    end

end