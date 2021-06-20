Fakemon = Class{}

function Fakemon:init(def, level)
    self.level = level

    self.name = def.name
    self.battleSpriteFront = def.battleSpriteFront
    self.battleSpriteBack = def.battleSpriteBack

    self.baseHP = def.baseHP
    self.baseAttack = def.baseAttack
    self.baseDef = def.baseDef
    self.baseSAttack = def.baseSAttack
    self.baseSDef = def.baseSDef
    self.baseSpeed = def.baseSpeed

    self.IVHP = def.IVHP
    self.IVAttack = def.IVAttack
    self.IVDef = def.IVDef
    self.IVSAttack = def.IVSAttack
    self.IVSDef = def.IVSDef
    self.IVSpeed = def.IVSpeed

    self.HP = def.baseHP
    self.Attack = def.baseAttack
    self.Def = def.baseDef
    self.SAttack = def.baseSAttack
    self.SDef = def.baseSDef
    self.Speed = def.baseSpeed
    
    self.currentXP = 0
    self.expToLevel = self.level * self.level * 5 * 0.75
    self:calculateStats()

    self.currentHP = self.HP
end

function Fakemon:getRandomDef()
    return FAKEMON_DEFS[FAKEMON_IDS[math.random(#FAKEMON_IDS)]]
end

function Fakemon:calculateStats()
    for i = 1, self.level do
        self:statsLevelUp()
    end
end

function Fakemon:statsLevelUp()
    local HPIncrease = 0
    for i = 1, 3 do
        if math.random(31) <= self.IVHP then
            self.HP = self.HP + 1
            HPIncrease = HPIncrease + 1
        end
    end

    local attackIncrease = 0
    for i = 1, 3 do
        if math.random(31) <= self.IVAttack then
            self.Attack = self.Attack + 1
            attackIncrease = attackIncrease + 1
        end
    end

    local defenseIncrease = 0
    for i = 1, 3 do
        if math.random(31) <= self.IVDef then
            self.Def = self.Def + 1
            defenseIncrease = defenseIncrease + 1
        end
    end

    local spAttackIncrease = 0
    for i = 1, 3 do
        if math.random(31) <= self.IVSAttack then
            self.SAttack = self.SAttack + 1
            spAttackIncrease = spAttackIncrease + 1
        end
    end

    local spDefenseIncrease = 0
    for i = 1, 3 do
        if math.random(31) <= self.IVSDef then
            self.SDef = self.SDef + 1
            spDefenseIncrease = spDefenseIncrease + 1
        end
    end

    local speedIncrease = 0
    for i = 1, 3 do
        if math.random(31) <= self.IVSpeed then
            self.Speed = self.Speed + 1
            speedIncrease = speedIncrease + 1
        end
    end

    return {HPIncrease, attackIncrease, defenseIncrease, spAttackIncrease, spDefenseIncrease, speedIncrease}
end

function Fakemon:levelUp()
    self.level = self.level + 1
    self.expToLevel = self.level * self.level * 5 * 0.75
    self.currentHP = self.currentHP + self.currentHP * (self.level / 10)
    return self:statsLevelUp()
end