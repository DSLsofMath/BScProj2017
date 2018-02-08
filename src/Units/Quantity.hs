
module Quantity
(
)
where

import Prelude hiding (length)
import Helper

import Unit
import Prefix


------------------------------------------------------------
-- Grund

data Quantity r = Quantity  -- En storhet har...
                  r         -- ... ett mätetal
                  Prefix    -- ... ett prefix
                  Unit      -- ... och en enhet

-- Snabbsätt att skriva en kvantitet
ofUnit :: r -> Unit -> Quantity r
r `ofUnit` u = Quantity r One u

-- Snabbsätt att använda snabbsättet
(#) :: r -> Unit -> Quantity r
(#) = ofUnit


------------------------------------------------------------
-- Instansiering av Quantity

-- Så att de vanliga räknresätten kan användas

instance (Eq r) => Eq (Quantity r) where
  (Quantity r1 _ u1) == (Quantity r2 _ u2) = r1 == r2 && u1 == u2

instance (Num r) => Num (Quantity r) where
  (Quantity r1 _ u1) + (Quantity r2 _ u2) = Quantity (r1+r2) One (u1+u2)
  (Quantity r1 _ u1) * (Quantity r2 _ u2) = Quantity (r1*r2) One (u1*u2)
  abs (Quantity r _ u)    = Quantity (abs r) One (abs u)
  signum (Quantity r _ u) = Quantity (signum r) One (signum u)
  fromInteger n           = Quantity (fromInteger n) One one
  negate (Quantity r _ u) = Quantity (negate r) One (negate u)

instance (Fractional r) => Fractional (Quantity r) where
  fromRational r         = Quantity (fromRational r) One one
  recip (Quantity r _ u) = Quantity (recip r) One (recip u)

instance (Floating r) => Floating (Quantity r) where
  pi                     = Quantity pi        One pi
  exp   (Quantity r _ u) = Quantity (exp r)   One (exp u)
  log   (Quantity r _ u) = Quantity (log r)   One (log u)
  sin   (Quantity r _ u) = Quantity (sin r)   One (sin u)
  cos   (Quantity r _ u) = Quantity (cos r)   One (cos u)
  asin  (Quantity r _ u) = Quantity (asin r)  One (asin u)
  acos  (Quantity r _ u) = Quantity (acos r)  One (acos u)
  atan  (Quantity r _ u) = Quantity (atan r)  One (atan u)
  sinh  (Quantity r _ u) = Quantity (sinh r)  One (sinh u)
  cosh  (Quantity r _ u) = Quantity (cosh r)  One (cosh u)
  asinh (Quantity r _ u) = Quantity (asinh r) One (asinh u)
  acosh (Quantity r _ u) = Quantity (acosh r) One (acosh u)
  atanh (Quantity r _ u) = Quantity (atanh r) One (atanh u)

instance (Show r) => Show (Quantity r) where
  show (Quantity r p u) = show r ++ " " ++ show u


------------------------------------------------------------
-- Exempel

-- 5 meter
l1 = 5 `ofUnit` length
-- 3 meter
l2 = 3 `ofUnit` length
-- 15 kvadratmeter
yta = l1 * l2
-- 8 sekunder
t1 = 8 `ofUnit` time