import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure GroupActionPackage {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    (G : DiffeomorphismGroupPackage M) where
  actionMap : Type v
  compatibilityWithGroup : Prop
  continuityOfAction : Prop
  smoothnessOfAction : Prop

structure GroupActionEvidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} (A : GroupActionPackage G) where
  compatibilityWithGroupClosed : A.compatibilityWithGroup
  continuityOfActionClosed : A.continuityOfAction
  smoothnessOfActionClosed : A.smoothnessOfAction

def GroupActionClosed {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} (A : GroupActionPackage G) : Prop :=
  A.compatibilityWithGroup ∧ A.continuityOfAction ∧ A.smoothnessOfAction

theorem group_action_closed_from_evidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} (A : GroupActionPackage G)
    (E : GroupActionEvidence A) : GroupActionClosed A := by
  exact And.intro E.compatibilityWithGroupClosed
    (And.intro E.continuityOfActionClosed E.smoothnessOfActionClosed)

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse
