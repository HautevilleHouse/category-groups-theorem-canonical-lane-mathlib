import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure CategoryGroupsAdmittedObject where
  yoneda : YonedaEmbeddingPackage
  yonedaEvidence : YonedaEmbeddingEvidence yoneda
  adjoint : AdjointFunctorPackage
  adjointEvidence : AdjointFunctorEvidence adjoint
  limitColimit : LimitColimitPackage
  limitColimitEvidence : LimitColimitEvidence limitColimit
  monoidal : MonoidalCategoryPackage
  monoidalEvidence : MonoidalCategoryEvidence monoidal
  abelian : AbelianCategoryPackage
  abelianEvidence : AbelianCategoryEvidence abelian

def CategoryGroupsWitnessClosed (O : CategoryGroupsAdmittedObject) : Prop :=
  YonedaEmbeddingClosed O.yoneda ∧ AdjointFunctorClosed O.adjoint ∧
  LimitColimitClosed O.limitColimit ∧ MonoidalCategoryClosed O.monoidal ∧
  AbelianCategoryClosed O.abelian

theorem category_groups_witness_closed_from_object
    (O : CategoryGroupsAdmittedObject) : CategoryGroupsWitnessClosed O := by
  refine And.intro (yoneda_embedding_closed_from_evidence O.yoneda O.yonedaEvidence)
    (And.intro (adjoint_functor_closed_from_evidence O.adjoint O.adjointEvidence)
      (And.intro (limit_colimit_closed_from_evidence O.limitColimit O.limitColimitEvidence)
        (And.intro (monoidal_category_closed_from_evidence O.monoidal O.monoidalEvidence)
          (abelian_category_closed_from_evidence O.abelian O.abelianEvidence))))

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse
