import HautevilleHouse.CategoryGroupsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjoint : Type u → Type v
  rightAdjoint : Type u → Type v
  unit : Prop
  counit : Prop
  triangleIdentities : Prop

structure AdjointFunctorEvidence (C : AdjointFunctorPackage) where
  unitClosed : C.unit
  counitClosed : C.counit
  triangleIdentitiesClosed : C.triangleIdentities

def AdjointFunctorClosed (C : AdjointFunctorPackage) : Prop :=
  C.unit ∧ C.counit ∧ C.triangleIdentities

theorem adjoint_functor_closed_from_evidence (C : AdjointFunctorPackage) (E : AdjointFunctorEvidence C) :
    AdjointFunctorClosed C := by
  exact And.intro E.unitClosed (And.intro E.counitClosed E.triangleIdentitiesClosed)

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse