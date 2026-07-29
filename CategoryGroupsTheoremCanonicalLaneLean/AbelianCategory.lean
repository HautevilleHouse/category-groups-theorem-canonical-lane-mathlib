import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure AbelianCategoryPackage where
  category : Type u
  zeroObject : Type v
  kernels : Type w
  cokernels : Type x
  abelianAxioms : Prop

structure AbelianCategoryEvidence (A : AbelianCategoryPackage) where
  abelianAxiomsClosed : A.abelianAxioms

def AbelianCategoryClosed (A : AbelianCategoryPackage) : Prop :=
  A.abelianAxioms

theorem abelian_category_closed_from_evidence (A : AbelianCategoryPackage)
    (E : AbelianCategoryEvidence A) : AbelianCategoryClosed A := by
  exact E.abelianAxiomsClosed

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse
