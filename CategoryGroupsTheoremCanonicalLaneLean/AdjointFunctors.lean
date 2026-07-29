import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure AdjointPair (C D : Type u) [Category C] [Category D] where
  left : Functor D C
  right : Functor C D
  unit : 𝟙 D ⟶ right ⋙ left
  counit : left ⋙ right ⟶ 𝟙 C
  triangleLeft : ∀ (X : D), counit.app (left.obj X) ∘ left.map (unit.app X) = 𝟙 (left.obj X)
  triangleRight : ∀ (Y : C), right.map (counit.app Y) ∘ unit.app (right.obj Y) = 𝟙 (right.obj Y)

structure AdjointFunctorEvidence (C D : Type u) [Category C] [Category D] (F : Functor D C) where
  rightAdjoint : Functor C D
  adjunction : AdjointPair C D
  adjunctionConstructed : adjunction.left = F ∧ adjunction.right = rightAdjoint

def AdjointClosure (C D : Type u) [Category C] [Category D] (F : Functor D C) : Prop :=
  ∃ (adj : AdjointFunctorEvidence C D F), True

theorem adjoint_closed_from_evidence (C D : Type u) [Category C] [Category D] (F : Functor D C) (E : AdjointFunctorEvidence C D F) : AdjointClosure C D F :=
  Exists.intro E trivial

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse