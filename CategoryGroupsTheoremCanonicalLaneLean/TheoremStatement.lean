import Mathlib.CategoryTheory.Yoneda

/-!
# Theorem Statement for Category Groups Theorem

This module defines the admitted object and the core witness condition.
-/

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

open CategoryTheory

structure CategorySpace where
  carrier : Type u
  category : Category carrier

structure CategoryAdmittedObject where
  space : CategorySpace
  hasLimits : Prop
  hasColimits : Prop
  yonedaFullFaithful : Prop
  adjointFunctorTheorem : Prop
  conclusion : yonedaFullFaithful ∧ adjointFunctorTheorem

def CategoryWitnessClosed (O : CategoryAdmittedObject) : Prop :=
  O.yonedaFullFaithful ∧ O.adjointFunctorTheorem

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse