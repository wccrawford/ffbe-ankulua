DIR = 'RaidAttack'

-- ramza = Pattern(DIR .. '/Ramza.png')
-- delita = Pattern(DIR .. '/Delita.png')
xon = Pattern(DIR .. '/Xon.png')
-- hyoh = Pattern(DIR .. '/Hyoh.png')
-- malphasie = Pattern(DIR .. '/Malphasie.png')
-- loren = Pattern(DIR .. '/Loren.png')
-- zargabaath = Pattern(DIR .. '/Zargabaath.png')
akstar = Pattern(DIR .. '/Akstar.png')
zeno = Pattern(DIR .. '/Zeno.png')
esther = Pattern(DIR .. '/Esther.png')
sylvie = Pattern(DIR .. '/Sylvie.png')

greenorb = Pattern(DIR .. '/GreenOrb.png')
questnext = Pattern(DIR .. '/QuestNext.png')
companion = Pattern(DIR .. '/Companion.png')
depart = Pattern(DIR .. '/Depart.png')
results = Pattern(DIR .. '/ResultsSmall.png')
resultsnext = Pattern(DIR .. '/Next.png')
resultsnext2 = Pattern(DIR .. '/ResultsNext2.png')
dailyquestcompleted = Pattern(DIR .. '/DailyQuestCompleted.png')
dailyquestclose = Pattern(DIR .. '/DailyQuestClose.png')
okay = Pattern(DIR .. '/Okay.png')

-- herosrime = Pattern(DIR .. '/HerosRime.png')
-- dualbreak = Pattern(DIR .. '/DualBreak.png')
-- helmbreak = Pattern(DIR .. '/HelmBreak.png')
-- shieldbreak = Pattern(DIR .. '/ShieldBreak.png')
-- generalsmanifesto = Pattern(DIR .. '/GeneralsManifesto.png')
-- archadiasmight = Pattern(DIR .. '/ArchadiasMight.png')
waylay = Pattern(DIR .. '/Waylay.png')
-- doubleblade = Pattern(DIR .. '/DoubleBlade.png')
-- servantoftheblade = Pattern(DIR .. '/ServantOfTheBlade.png')
-- tenebrousdive = Pattern(DIR .. '/TenebrousDiveSmall.png')
akstarDBA = Pattern(DIR .. '/Akstar-DoubleBladeArt.png')
akstarMOE = Pattern(DIR .. '/Akstar-MoEDisorder.png')
zenoDBA = Pattern(DIR .. '/Zeno-DoubleBladeArt.png')
zenoMOE = Pattern(DIR .. '/Zeno-MoEDisorder.png')
estherBS = Pattern(DIR .. '/Esther-BoltingStrike.png')
estherEC = Pattern(DIR .. '/Esther-ElectricCharge.png')
sylvieMWOM = Pattern(DIR .. '/Sylvie-MarianWatchOverMe.png')
-- akstarDBA = Pattern(DIR .. '/')

screenheight = 1280
screenwidth = 720
middleLeft = Location(50, screenheight / 2)
middleRight = Location(screenwidth - 50, screenheight / 2)
bottomRegion = Region(0, 780, 720, 500)
skillsRegion = Region(0, 780, 720, 355)
bottomLeftRegion = Region(0, 780, 360, 500)
bottomMiddleRegion = Region(240, 780, 240, 500)
middleRegion = Region(0, 400, 720, 480)
topRegion = Region(0, 0, 720, 400)

eltraid = Location(screenwidth / 2, 740)
topcompanion = Location(screenwidth / 2, 430)

function swipeCharacterRight(character)
    if(bottomRegion:exists(character, 0)) then
        characterMatch = bottomRegion:getLastMatch()
        characterLocation = Location(characterMatch:getX(), characterMatch:getY())
        characterRight = Location(characterLocation:getX() + (screenwidth / 4), characterLocation:getY())
        swipe(characterLocation, characterRight)
    end
end

function clickCharacter(character)
    if(bottomRegion:exists(character, 0)) then
       click(bottomRegion:getLastMatch())
    end
end

function swipeAbilitiesUp()
    skillsLocation = Location(
        skillsRegion:getX() + (skillsRegion:getW() / 2),
        skillsRegion:getY() + (skillsRegion:getH() / 2)
    )
    skillsLocationUp = Location(skillsLocation:getX(), skillsLocation:getY() - 180)
    swipe(skillsLocation, skillsLocationUp)
    wait(1)
end

function chooseAbility(ability, clickTwice)
    found = false
    while(found == false) do
        if(skillsRegion:exists(ability, 0)) then
            match = skillsRegion:getLastMatch()
            click(match)
            wait(0.5)
            if(clickTwice == true) then
                click(match)
                wait(0.5)
            end
            found = true
        else
            swipeAbilitiesUp()
        end
    end
end


while(true) do
    if(topRegion:exists(greenorb)) then
        click(eltraid)
        wait(0.5)

--        waitClick(questnext, 5)
    end

    if(bottomRegion:exists(questnext)) then
        click(bottomRegion:getLastMatch())
        wait(3)
    end

    if(topRegion:exists(companion)) then
        wait(0.5)
        click(topcompanion)
    end

    if(bottomRegion:exists(depart)) then
        wait(0.5)
        click(depart, 5)
    end

    if(bottomRegion:exists(xon)) then
        wait(1)

--        Settings:set('MinSimilarity', 0.95)
--        swipeCharacterRight(hyoh)
--        chooseAbility(doubleblade, false)
--        wait(1)
--        swipeAbilitiesUp()
--        chooseAbility(servantoftheblade, true)

        -- swipeCharacterRight(delita)
        -- chooseAbility(dualbreak, false)
        -- chooseAbility(shieldbreak, false)
        -- chooseAbility(helmbreak, false)

--        Settings:set('MinSimilarity', 0.7)
        swipeCharacterRight(sylvie)
        chooseAbility(sylvieMWOM, true)

--        swipeCharacterRight(zargabaath)
--        chooseAbility(archadiasmight, true)

        -- swipeCharacterRight(ramza)
        -- chooseAbility(herosrime, true)

        swipeCharacterRight(xon)
        chooseAbility(waylay, false)

        swipeCharacterRight(akstar)
        chooseAbility(akstarDBA, false)
        Settings:set('MinSimilarity', 0.98)
        chooseAbility(akstarMOE, true)
        Settings:set('MinSimilarity', 0.7)

        swipeCharacterRight(zeno)
        chooseAbility(zenoDBA, false)
        Settings:set('MinSimilarity', 0.98)
        chooseAbility(zenoMOE, true)
        Settings:set('MinSimilarity', 0.7)

        swipeCharacterRight(esther)
        chooseAbility(estherEC, false)
        Settings:set('MinSimilarity', 0.98)
        chooseAbility(estherBS, true)
        Settings:set('MinSimilarity', 0.7)

--        swipeCharacterRight(malphasie)
--        chooseAbility(tenebrousdive, false)

        -- clickCharacter(delita)
        -- clickCharacter(delita)
--        clickCharacter(loren)
--        clickCharacter(zargabaath)
--        wait(1)
--        clickCharacter(xon)
--        clickCharacter(hyoh)
--        clickCharacter(malphasie)

        xonloc = nil
        akstarloc = nil
        zenoloc = nil
        estherloc = nil
        sylvieloc = nil

        if(bottomRegion:exists(sylvie)) then
            sylvieloc = bottomRegion:getLastMatch()
        end
        if(bottomRegion:exists(xon)) then
            xonloc = bottomRegion:getLastMatch()
        end
        if(bottomRegion:exists(akstar)) then
            akstarloc = bottomRegion:getLastMatch()
        end
        if(bottomRegion:exists(zeno)) then
            zenoloc = bottomRegion:getLastMatch()
        end
        if(bottomRegion:exists(esther)) then
            estherloc = bottomRegion:getLastMatch()
        end

        if(sylvieloc) then
            click(sylvieloc)
        end
        if(xonloc) then
            click(xonloc)
        end
        if(akstarloc) then
            click(akstarloc);
        end
        if(zenoloc) then
            click(zenoloc)
        end
        if(estherloc) then
            click(estherloc)
        end

        exists(results, 30)
    end

    if(exists(results)) then
        click(getLastMatch())
        click(getLastMatch())
        click(getLastMatch())
        click(getLastMatch())
    end

    if(bottomRegion:exists(resultsnext)) then
        click(bottomRegion:getLastMatch())
    end

    if(bottomRegion:exists(resultsnext2)) then
        click(bottomRegion:getLastMatch())
    end

    if(topRegion:exists(dailyquestcompleted)) then
        if(middleRegion:exists(dailyquestclose)) then
            click(middleRegion:getLastMatch())
        end
    end

    if(exists(okay)) then
        click(getLastMatch())
    end
end
