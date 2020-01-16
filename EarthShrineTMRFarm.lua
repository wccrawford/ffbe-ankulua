icon = Pattern('EarthShrineTMRFarm/FFEXVIUS.png')
taptostart = Pattern('EarthShrineTMRFarm/TapToStart.png')
biglogo = Pattern('EarthShrineTMRFarm/BigLogo.png')
world = Pattern('EarthShrineTMRFarm/World.png')
gronoa = Pattern('EarthShrineTMRFarm/Gronoa.png')
grandshelt = Pattern('EarthShrineTMRFarm/Grandshelt.png')
grandsheltisles = Pattern('EarthShrineTMRFarm/GrandsheltIsles.png')
ordolport = Pattern('EarthShrineTMRFarm/OrdolPort.png')
earthshrine = Pattern('EarthShrineTMRFarm/EarthShrine.png')
earthshrineentrance = Pattern('EarthShrineTMRFarm/EarthShrine-Entrance.png')
limit = Pattern('EarthShrineTMRFarm/Limit.png')
nextbutton = Pattern('EarthShrineTMRFarm/NextButton.png')
nextbutton2 = Pattern('EarthShrineTMRFarm/NextButton2.png')
okaybutton = Pattern('EarthShrineTMRFarm/OkayButton.png')
departbutton = Pattern('EarthShrineTMRFarm/DepartButton.png')
dontrequestbutton = Pattern('EarthShrineTMRFarm/DontRequestButton.png')
yesbutton = Pattern('EarthShrineTMRFarm/YesButton.png')
nobutton = Pattern('EarthShrineTMRFarm/NoButton.png')
backbutton = Pattern('EarthShrineTMRFarm/BackButton.png')
closebutton = Pattern('EarthShrineTMRFarm/CloseButton.png')
playmission = Pattern('EarthShrineTMRFarm/PlayMission.png')
magspr = Pattern('EarthShrineTMRFarm/MagSpr.png')
mpdefspr = Pattern('EarthShrineTMRFarm/MpDefSpr.png')
unfortunatelyappstopped = Pattern('EarthShrineTMRFarm/UnfortunatelyAppStopped.png')
unfortunatelyappstoppedokay = Pattern('EarthShrineTMRFarm/UnfortunatelyAppStoppedOkay.png')
departwithoutcompanion = Pattern('EarthShrineTMRFarm/DepartWithoutCompanion.png')

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
    if middleRegion:exists(icon, 0) then
        click(middleRegion:getLastMatch())
        usePreviousSnap(false)
        exists(taptostart, 5)
    end
    usePreviousSnap(true)

    if middleRegion:exists(playmission) then
        if middleRegion:exists(yesbutton) then
            click(middleRegion:getLastMatch())
            usePreviousSnap(false)
            waitVanish(playmission, 10)
            usePreviousSnap(true)
        end
    end

    if exists(taptostart, 0) then
        click(getLastMatch())
        usePreviousSnap(false)
        exists(world, 15)
        usePreviousSnap(true)
    end

    if bottomMiddleRegion:exists(world, 0) then
        click(bottomMiddleRegion:getLastMatch())
        usePreviousSnap(false)
        exists(gronoa, 5)
        usePreviousSnap(true)
    end

    if exists(gronoa, 0) then
        swipe(middleRight, middleLeft)
        usePreviousSnap(false)
        exists(grandshelt, 5)
        usePreviousSnap(true)
    end

    if exists(grandshelt, 0) then
        click(getLastMatch())
        usePreviousSnap(false)
        exists(grandsheltisles, 5)
        usePreviousSnap(true)
    end

    if exists(grandsheltisles, 0) then
        click(getLastMatch())
        usePreviousSnap(false)
        exists(ordolport, 5)
        usePreviousSnap(true)
    end

    if exists(ordolport, 0) then
        swipe(middleLeft, middleRight)
        usePreviousSnap(false)
        exists(earthshrine, 5)
        usePreviousSnap(true)
    end

    if exists(earthshrine, 0) then
        click(getLastMatch())
        usePreviousSnap(false)
        exists(earthshrineentrance, 5)
        usePreviousSnap(true)
    end

    if middleRegion:exists(okaybutton, 0) then
        click(middleRegion:getLastMatch())
    end

    if middleRegion:exists(backbutton, 0) then
        click(middleRegion:getLastMatch())
    end

    if middleRegion:exists(closebutton, 0) then
        click(middleRegion:getLastMatch())
    end

    if middleRegion:exists(unfortunatelyappstopped, 0) then
        if middleRegion:exists(unfortunatelyappstoppedokay, 0) then
            click(middleRegion:getLastMatch())
        end
    end

    -- Do this more often than the other stuff
    for loops = 0, 20, 1 do
        usePreviousSnap(false)
        if middleRegion:exists(earthshrineentrance, 0) then
            click(middleRegion:getLastMatch())
            usePreviousSnap(false)
            exists(nextbutton, 5)
        end
        usePreviousSnap(true)

        if bottomMiddleRegion:exists(departbutton, 0) then
            click(bottomMiddleRegion:getLastMatch())
        end

        if bottomMiddleRegion:exists(nextbutton, 0) then
            click(bottomMiddleRegion:getLastMatch())
        end

        if bottomMiddleRegion:exists(nextbutton2, 0) then
            click(bottomMiddleRegion:getLastMatch())
        end

        if exists(mpdefspr, 0) then
            click(getLastMatch())
        end

        if exists(departwithoutcompanion, 0) then
            click(getLastMatch())
        end

        if topRegion:exists(magspr, 0) then
            if middleRegion:exists(magspr, 0) then
                percDispReg:highlightOff();

                match = middleRegion:getLastMatch();

                perc1 = tostring(numberOCRNoFindException(percReg1, "EarthShrineTMRFarm/common_num20_") / 10)
                perc2 = tostring(numberOCRNoFindException(percReg2, "EarthShrineTMRFarm/common_num20_") / 10)
                perc3 = tostring(numberOCRNoFindException(percReg3, "EarthShrineTMRFarm/common_num20_") / 10)
                perc4 = tostring(numberOCRNoFindException(percReg4, "EarthShrineTMRFarm/common_num20_") / 10)
                perc5 = tostring(numberOCRNoFindException(percReg5, "EarthShrineTMRFarm/common_num20_") / 10)
                percs = perc1 .. "% " .. perc2 .. "% " .. perc3 .. "% " .. perc4 .. "% " .. perc5 .. "%"
                percDispReg:highlight(percs)

                params = "tmr0=" .. perc1
                        .. "&tmr1=" .. perc2
                        .. "&tmr2=" .. perc3
                        .. "&tmr3=" .. perc4
                        .. "&tmr4=" .. perc5

                -- httpGet("http://misc.dev.eyen.us/tmrprogress.php?"..params)

                click(match)
            end
        end

        if bottomLeftRegion:exists(limit, 0) then
            -- Old snap might just have 1 "visible" somehow
            usePreviousSnap(false)
            limits = regionFindAllNoFindException(bottomLeftRegion, limit);
            for i, m in ipairs(limits) do
                if (i % 2 == 1) then
                    click(m)
                end
            end
            usePreviousSnap(true)
        end

        if bottomRegion:exists(dontrequestbutton, 0) then
            click(bottomRegion:getLastMatch())
        end

        wait(1)
    end
end