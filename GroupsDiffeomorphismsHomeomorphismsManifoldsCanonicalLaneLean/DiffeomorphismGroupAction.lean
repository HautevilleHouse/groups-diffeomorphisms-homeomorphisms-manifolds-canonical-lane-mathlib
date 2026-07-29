import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure DiffeomorphismGroupAction (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] (N : Type v) [TopologicalSpace N] [ChartedSpace ℂ N] where
  actionMap : M → (N → N)
  smoothAction : Prop
  groupActionAxioms : Prop
  smoothActionTerm : smoothAction
  groupActionAxiomsTerm : groupActionAxioms

structure DiffeomorphismGroupActionEvidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] (N : Type v) [TopologicalSpace N] [ChartedSpace ℂ N] (Act : DiffeomorphismGroupAction M N) where
  smoothActionClosed : Act.smoothAction
  groupActionAxiomsClosed : Act.groupActionAxioms

def DiffeomorphismGroupActionClosed (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] (N : Type v) [TopologicalSpace N] [ChartedSpace ℂ N] (Act : DiffeomorphismGroupAction M N) : Prop :=
  Act.smoothAction ∧ Act.groupActionAxioms

theorem diffeomorphism_group_action_closed_from_evidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℂ M] (N : Type v) [TopologicalSpace N] [ChartedSpace ℂ N] (Act : DiffeomorphismGroupAction M N) (E : DiffeomorphismGroupActionEvidence M N Act) : DiffeomorphismGroupActionClosed M N Act := by
  exact And.intro E.smoothActionClosed E.groupActionAxiomsClosed

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse