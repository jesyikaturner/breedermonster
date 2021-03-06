CREATE TABLE IF NOT EXISTS Species(
    speciesType VARCHAR(100) NOT NULL UNIQUE, -- Primary Key
    speciesDescription VARCHAR(500),
    allowedElementTypes INTEGER UNSIGNED NOT NULL, -- Foreign Key
    rarity ENUM('common', 'uncommon', 'rare', 'epic', 'legendary') DEFAULT 'common',
    speciesAttributes INTEGER UNSIGNED NOT NULL, -- Foreign Key

    PRIMARY KEY (speciesType),
    CONSTRAINT fk_SpeciesAttribute FOREIGN KEY (speciesAttributes)
        REFERENCES MonsterAttributes(attributeId)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Monsters(
    monsterName VARCHAR(100) NOT NULL UNIQUE, --Primary Key 
    speciesType VARCHAR(100) NOT NULL,  -- Foreign Key
    monsterEggId INTEGER UNSIGNED NOT NULL, --Foreign Key

    -- TODO: element
    -- TODO: Age
    -- TODO: User -- Foreign Key
    -- TODO: Equipment -- Foreign Key
    -- TODO: plan out customization like changing its colour with a potion (see neopets paintbrushes)


    elementGenetics INTEGER UNSIGNED NOT NULL UNIQUE, --Foreign Key. Adds up to 100.
    elementResistance INTEGER UNSIGNED NOT NULL UNIQUE, --Foreign Key
    attributeGenetics INTEGER UNSIGNED NOT NULL UNIQUE, --TODO: Foreign Key
    trainingValues INTEGER UNSIGNED NOT NULL UNIQUE, --TODO: Foreign Key

    
    PRIMARY KEY (monsterName),
    CONSTRAINT fk_MonsterSpecies FOREIGN KEY (speciesType)
        REFERENCES Species(speciesType)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_MonsterEgg FOREIGN KEY (monsterEggId)
        REFERENCES MonsterEggs(eggId)
        ON UPDATE CASCADE ON DELETE CASCADE
    CONSTRAINT fk_MonsterElementGenetics FOREIGN KEY (elementGenetics)
        REFERENCES ElementGenetics(elementAttributeId)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_MonsterElementResistance FOREIGN KEY (elementResistance)
        REFERENCES ElementResistances(elementAttributeId)
        ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE IF NOT EXISTS MonsterProfile(
    --TODO: this
);

CREATE TABLE IF NOT EXISTS MonsterEggs(
    eggId INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    hatchingTime ENUM('short', 'medium', 'long', 'extralong', 'hatched') DEFAULT 'short',

    PRIMARY KEY (eggId)
);

CREATE TABLE IF NOT EXISTS ElementGenetics(
    elementAttributeId INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    fire FLOAT(5,2) DEFAULT 0.00,
    water FLOAT(5,2) DEFAULT 0.00,
    wind FLOAT(5,2) DEFAULT 0.00,
    earth FLOAT(5,2) DEFAULT 0.00,
    light FLOAT(5,2) DEFAULT 0.00,
    shadow FLOAT(5,2) DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS ElementResistances LIKE ElementGenetics;

CREATE TABLE IF NOT EXISTS ElementTable(
    elementTableId INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    fire ENUM('false', 'true') DEFAULT 'false',
    water ENUM('false', 'true') DEFAULT 'false',
    wind ENUM('false', 'true') DEFAULT 'false',
    earth ENUM('false', 'true') DEFAULT 'false',
    light ENUM('false', 'true') DEFAULT 'false',
    shadow ENUM('false', 'true') DEFAULT 'false',
    abyssal ENUM('false', 'true') DEFAULT 'false',
    storm ENUM('false', 'true') DEFAULT 'false',
    energy ENUM('false', 'true') DEFAULT 'false',
    death ENUM('false', 'true') DEFAULT 'false',
    metal ENUM('false', 'true') DEFAULT 'false',
    nature ENUM('false', 'true') DEFAULT 'false',
    twilight ENUM('false', 'true') DEFAULT 'false' ,
    ruin ENUM('false', 'true') DEFAULT 'false',
    magic ENUM('false', 'true') DEFAULT 'false',
    magma ENUM('false', 'true') DEFAULT 'false',
    artic ENUM('false', 'true') DEFAULT 'false',
    tempest ENUM('false', 'true') DEFAULT 'false',
    creation ENUM('false', 'true') DEFAULT 'false'
);

CREATE TABLE IF NOT EXISTS SpeciesAttributes(
    attributeId INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    health TINYINT UNSIGNED DEFAULT 0, -- max val is 255, which suits my needs
    mana TINYINT UNSIGNED DEFAULT 0,
    strength TINYINT UNSIGNED DEFAULT 0,
    agility TINYINT UNSIGNED DEFAULT 0,
    intellect TINYINT UNSIGNED DEFAULT 0,
);

CREATE TABLE IF NOT EXISTS MonsterAttributes LIKE SpeciesAttributes;
CREATE TABLE IF NOT EXISTS TrainingValues LIKE SpeciesAttributes;