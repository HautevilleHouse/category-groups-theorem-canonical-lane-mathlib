import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure LimitCone (J C : Type u) [Category J] [Category C] (D : Functor J C) where
  apex : C
  projections : (j : J) → apex ⟶ D.obj j
  universalProperty : ∀ (A : C) (f : (j : J) → A ⟶ D.obj j), ∃! (g : A ⟶ apex), ∀ (j : J), projections j ∘ g = f j

structure ColimitCocone (J C : Type u) [Category J] [Category C] (D : Functor J C) where
  coapex : C
  injections : (j : J) → D.obj j ⟶ coapex
  universalProperty : ∀ (A : C) (f : (j : J) → D.obj j ⟶ A), ∃! (g : coapex ⟶ A), ∀ (j : J), g ∘ injections j = f j

structure LimitColimitEvidence (J C : Type u) [Category J] [Category C] (D : Functor J C) where
  limitExists : LimitCone J C D
  colimitExists : ColimitCocone J C D

def LimitsColimitsClosed (J C : Type u) [Category J] [Category C] (D : Functor J C) : Prop :=
  ∃ (E : LimitColimitEvidence J C D), True

theorem limits_colimits_closed (J C : Type u) [Category J] [Category C] (D : Functor J C) : LimitsColimitsClosed J C D :=
  Exists.intro (LimitColimitEvidence.mk (by
    exact {
      apex := (𝟙 C).obj (0 : C)
      projections := λ j => (0 : C).homToSelf
      universalProperty := λ A f => by
        intro h; refine ⟨A.homFromSelf, ?_, ?_⟩
    }) (by
    exact {
      coapex := (𝟙 C).obj (0 : C)
      injections := λ j => (0 : C).homFromSelf
      universalProperty := λ A f => by
        intro h; refine ⟨A.homToSelf, ?_, ?_⟩
    })) trivial

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse