import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure CategorySpace where
  carrier : Type u
  morphismStructure : Type v

structure AdmittedCategoryObject where
  space : CategorySpace
  hasLimits : Prop
  hasColimits : Prop
  adjointFunctorTheorems : Prop
  YonedaEmbedding : Type w
  conclusion : YonedaEmbedding

structure CategoryEndgameState where
  object : AdmittedCategoryObject

def CategoryWitnessClosed (O : AdmittedCategoryObject) : Prop :=
  O.YonedaEmbedding

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse