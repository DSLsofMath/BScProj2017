module Proofs.Bevis where

{-
-- Bevis av "dom där fyra" kinematiska reglerna. Ha som axiom vanliga regler för algebra.

-- Börjar med a = dv/dt och a konstant
-- Bevisa att deltaV = a*deltaT

-- Sedan att deltaX = vI*deltaT + 0,5*a*deltaT^2

-- Integrera differential från i till f

data Equals lhs rhs

data Mul a b
data Div num den

-- Är något `undefined` är det axiom

-- Implikationer modelleras av funktioner från en sak
-- till en annan sak

-- a = b --> b = a
equCom :: Equals a b -> Equals b a
equCom = undefined

-- Likheter (mellan uttryck) modellas av två saker
-- i likhetstypen

-- a * b == b * a
mulCom :: Equals (Mul a b) (Mul b a)
mulCom = undefined

-- En implikation till

-- a / b = c --> a = c * b
mulUpDiv :: Equals (Div a b) c -> Equals a (Mul c b)
mulUpDiv = undefined

-- En differential av någonting. En infinitesimal bit av
-- något vid en obestämd tidpunkt.

data Diff a

-- "Om a == b, och a == c, så b == c"
transitivity :: Equals a b -> Equals a c -> Equals b c
transitivity = undefined

-- Tar som axiom
-- a = dv / dt
s0 :: Equals a (Div (Diff v) (Diff t))
s0 = undefined

-- dv / dt = a
s1 :: Equals (Div (Diff v) (Diff t)) a
s1 = equCom s0

-- dv = a * dt
s2 :: Equals (Diff v) (Mul a (Diff t))
s2 = mulUpDiv s1

-- Gör allmän integral på båda sidor, sedan
-- specifika evaluerare för olika fall!

-- Ska ses som en bestämd integral från "i till f"
data Integ a

-- a = b --> Integ a = Integ b
--bothSideInteg :: Equals a b -> Equals (Integ a) (Integ b)
--bothSideInteg = undefined
-- Här uppe kanske man ska kräva att en differential är
-- inblandad

bothSideInteg :: Equals (Mul a (Diff b)) (Mul c (Diff d)) -> Equals (Integ (Mul a (Diff b))) (Integ (Mul c (Diff d)))

{- Vill egentligen ha något sådant här

bothSideOp :: Equals a b -> op -> Equals (op a) (op b)
bothSideOp = undefined

-}

-- mulWithOne ::

s3 :: Equals (Integ (Diff v)) (Integ (Mul a (Diff t)))
s3 = bothSideInteg s2

-- Integrera dx från xi till xf ger... xf-xi! Detta kanske
-- man eventuellt ska bevisa senare

data Delta a

-- Allmänt: börja med många och kraftfulla axiom, för att
-- efterhand bevisa dem allt mer grundläggande

-- Integ dx i->f = deltaX
integDiff :: Equals (Integ (Diff a)) (Delta a)
integDiff = undefined

integConstant :: Equals (Integ (Mul k (Diff x)))  (Mul k (Integ (Diff x)))
integConstant = undefined
-- Problem: om k och x är samma gör denna funktion
-- otillåtna saker



s4 :: Equals (Integ (Mul a (Diff t))) (Delta v)
s4 = transitivity s3 integDiff

s5 :: Equals (Delta v) (Mul a (Integ (Diff t)))
s5 = transitivity s4 integConstant

-- Problem: hur använda en likhet "långt inne", som i fallet med s5. Här vill man använda `integDiff` inuti direkt på Mul a (Integ (Diff t))



-- Dessa blir typer
-- Integ k dx = k * Integ 1 dx
-- Integ 1 dx = x + C
-- Integ x dx = 0,5x^2 + C
-}
