import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure YonedaEmbedding (C : Type u) [Category C] where
  yoneda : Functor C (Cᵒᵖ ⥤ Type u)
  fullyFaithful : ∀ (X Y : C), Function.Bijective (yoneda.map (X ⟶ Y) : (X ⟶ Y) → (yoneda.obj X ⟶ yoneda.obj Y))

structure YonedaLemmaEvidence (C : Type u) [Category C] (F : Functor Cᵒᵖ (Type u)) where
  naturalBijection : (X : C) → (yoneda.obj X ⟶ F) ≃ F.obj (op X)
  naturalInX : ∀ (X : C) (α : yoneda.obj X ⟶ F) (f : Y ⟶ X), F.map f.op (naturalBijection X α) = naturalBijection Y (α ∘ yoneda.map f)

def YonedaClosure (C : Type u) [Category C] (F : Functor Cᵒᵖ (Type u)) : Prop :=
  ∃ (E : YonedaLemmaEvidence C F), True

theorem yoneda_lemma_closed (C : Type u) [Category C] (F : Functor Cᵒᵖ (Type u)) : YonedaClosure C F :=
  Exists.intro (YonedaLemmaEvidence.mk (fun X => { toFun := λ α => α.app (op X) (𝟙 X), invFun := λ x => { app := λ Z f => F.map f x, naturality := by intro Z W g; ext; simp }, left_inv := λ α => by ext Z f; simp, right_inv := λ x => by simp } ) (by
    intro X α f; ext; simp)) trivial

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse