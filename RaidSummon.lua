DIR = 'RaidSummon'

multisummon = Pattern(DIR .. '/Multi-Summon.png')
multisummon2 = Pattern(DIR .. '/Multi-Summon2.png')
next = Pattern(DIR .. '/Next.png')
treasurechest = Pattern(DIR .. '/TreasureChest.png')
unitsobtained = Pattern(DIR .. '/UnitsObtained.png')

screenheight = 1280
screenwidth = 720
middleLeft = Location(50, screenheight / 2)
middleRight = Location(screenwidth - 50, screenheight / 2)
bottomRegion = Region(0, 780, 720, 500)
bottomLeftRegion = Region(0, 780, 360, 500)
bottomMiddleRegion = Region(240, 780, 240, 500)
middleRegion = Region(0, 400, 720, 480)
topRegion = Region(0, 0, 720, 400)

percReg1 = Region(575, 200, 90, 30)
percReg2 = Region(575, 384, 90, 30)
percReg3 = Region(575, 568, 90, 30)
percReg4 = Region(575, 752, 90, 30)
percReg5 = Region(575, 935, 90, 30)
percDispReg = Region(100, 0, 520, 30)

while true do
    usePreviousSnap(false)

    if exists(multisummon, 0) then
        click(getLastMatch())
    end

    if exists(multisummon2, 0) then
        click(getLastMatch())
    end

    if exists(next, 0) then
        click(getLastMatch())
    end

    if exists(treasurechest, 0) then
        click(getLastMatch())
    end

    if exists(unitsobtained, 0) then
        click(getLastMatch())
    end

end