import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure MappingClassGroup (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] where
  diffeoGroup : DiffeomorphismGroup M
  isotopyRelation : Prop
  quotientGroup : Type u
  isotopyRelationTerm : isotopyRelation
  quotientGroupTerm : quotientGroup

structure MappingClassGroupEvidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] (MCG : MappingClassGroup M) where
  diffeoGroupClosed : DiffeomorphismGroupClosed M MCG.diffeoGroup
  isotopyRelationClosed : MCG.isotopyRelation

def MappingClassGroupClosed (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] (MCG : MappingClassGroup M) : Prop :=
  DiffeomorphismGroupClosed M MCG.diffeoGroup ∧ MCG.isotopyRelation

theorem mapping_class_group_closed_from_evidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] (MCG : MappingClassGroup M) (E : MappingClassGroupEvidence M MCG) : MappingClassGroupClosed M MCG := by
  exact And.intro E.diffeoGroupClosed E.isotopyRelationClosed

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse