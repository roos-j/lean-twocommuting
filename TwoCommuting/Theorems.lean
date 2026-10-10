/-
Copyright (c) 2026 Joris Roos. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Joris Roos
-/

module

public import Mathlib.Analysis.Complex.Norm
public import Mathlib.Dynamics.Ergodic.MeasurePreserving
public import Mathlib.MeasureTheory.Function.LpSeminorm.Defs

import TwoCommuting.Auto.Sec10IntegrableExtension

/-!
# Pointwise a.e. convergence of ergodic averages with respect to two commuting transformations

Let `(X, μ)` be a probability space and
`T, S` two commuting measure preserving transformations `X → X`.
Then for every `f ∈ L^p(μ), g ∈ L^q(μ)` with `p, q ∈ [1,∞]` and `p⁻¹ + q⁻¹ ≤ 1` the averages
`N⁻¹ ∑_{n=0}^{N-1} f(T^n x) g(S^n x)`
converge to a finite limit for a.e. `x` as `N → ∞`.

-/

public section

open MeasureTheory ENNReal Finset Filter Topology

variable {X : Type*} [MeasurableSpace X] {μ : Measure X} [IsProbabilityMeasure μ]

/-- Main pointwise a.e. convergence theorem for two commuting transformations -/
theorem pointwise_convergence_two_commuting {T S : X → X}
    (hT : MeasurePreserving T μ μ) (hS : MeasurePreserving S μ μ) (hTS : T ∘ S = S ∘ T)
    {p q : ℝ≥0∞} (hp : 1 ≤ p) (hq : 1 ≤ q) (hpq : p⁻¹ + q⁻¹ ≤ 1) {f g : X → ℂ}
    (hf : MemLp f p μ) (hg : MemLp g q μ) :
    ∀ᵐ x ∂μ, ∃ L, Tendsto
      (fun N : ℕ ↦ (N : ℂ)⁻¹ * ∑ n ∈ range N, f (T^[n] x) * g (S^[n] x)) atTop (𝓝 L) :=
  (Auto.commuting_ergodic_averages_converge_main hT hS hTS hp hq hpq hf hg).1

end
