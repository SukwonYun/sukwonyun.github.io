---
title: "Debating If LLM Reasoning Is \"Actually Reasoning\" Is Meaningless"
description: "Ever since CoT prompting was proposed, 
one of the most heated debates in AI has been whether LLMs can truly reason.
It is meaningless without a clear definition of reasoning. 
In our context, 
what we call LLM reasoning is simply the model generating more intermediate tokens before reaching a final answer. Nothing more is promised."
date: 2025-08-10
tldr: "LLM reasoning = Decoding candidates with more tokens + Better performance"
tags: ["Reasoning"]
---

Ever since chain-of-thought (CoT) prompting [^1] was proposed,
one of the most heated debates in AI has been whether large language models (LLMs) can _truly reason_.
This debate is meaningless without a clear definition of [reasoning](https://en.wikipedia.org/wiki/Reason).
In our context,
what we call [Reasoning LLMs](https://en.wikipedia.org/wiki/Reasoning_language_model) simply refers to models generating more intermediate tokens before reaching final answers [^2].
Nothing more is promised.

LLMs, as a type of probabilistic model,
learn to model the distribution of words (tokens) during pre-training and post-training.
At inference time, they decode tokens autoregressively after pre-filling an input prompt with their decoder-only Transformers.
What we aim for at test time is primarily this objective:

$$\argmax \mathbb{P}(\text{answer}\ |\ \text{problem})$$

Both theoretical [^3] and empirical [^2],[^4],[^5] studies have validated that by decoding more tokens at test time,
via various methods ([best-of-N](https://huggingface.co/docs/trl/en/best_of_n), CoT prompting [^1], thinking [^2]),
LLMs deliver stronger performance, demonstrating the well-known test-time scaling law [^6].

One often-overlooked fact is that LLMs, as probabilistic models,
are already capable of generating CoT-format responses right after pre-training.
The only requirement is moving beyond simple greedy decoding [^7],
as CoT-format responses naturally exist within pre-trained models.

**Now the question becomes: how do we reshape the decoding distribution to more easily obtain (long) CoT responses?**
Recent emergent post-training approaches [^4],[^5],[^8] provide the answers by optimizing this objective:

$$\argmax \mathbb{P}(\text{long CoT}, \text{answer}\ |\ \text{problem})$$

Hereby, we bring intermediate long CoT to the forefront before final answers - 
content that was present but hidden during pre-training and is now brought onstage.
This is also called LLM reasoning,
only because its CoT format resembles the step-by-step reasoning patterns of humans, and it works pretty well.

_The author kindly argues that, instead of debating whether this is "actual reasoning," it might be more preferable to build more useful things in practical and understand them rigorously._

## References
[^1]: Wei, J., Wang, X., Schuurmans, D., Bosma, M., Xia, F., Chi, E., Le, Q.V. and Zhou, D., 2022. Chain-of-thought prompting elicits reasoning in large language models. Advances in neural information processing systems, 35, pp.24824-24837.
[^2]: OpenAI Blog, 2024. Learning to Reason with LLMs.
[^3]: Li, Z., Liu, H., Zhou, D. and Ma, T., 2024. Chain of thought empowers transformers to solve inherently serial problems. arXiv preprint arXiv:2402.12875, 1.
[^4]: Guo, D., Yang, D., Zhang, H., Song, J., Zhang, R., Xu, R., Zhu, Q., Ma, S., Wang, P., Bi, X. and Zhang, X., 2025. Deepseek-r1: Incentivizing reasoning capability in llms via reinforcement learning. arXiv preprint arXiv:2501.12948.
[^5]: Yang, A., Li, A., Yang, B., Zhang, B., Hui, B., Zheng, B., Yu, B., Gao, C., Huang, C., Lv, C. and Zheng, C., 2025. Qwen3 technical report. arXiv preprint arXiv:2505.09388.
[^6]: Snell, C., Lee, J., Xu, K. and Kumar, A., 2024. Scaling llm test-time compute optimally can be more effective than scaling model parameters. arXiv preprint arXiv:2408.03314.
[^7]: Wang, X. and Zhou, D., 2024. Chain-of-thought reasoning without prompting. Advances in Neural Information Processing Systems, 37, pp.66383-66409.
[^8]: Shao, Z., Wang, P., Zhu, Q., Xu, R., Song, J., Bi, X., Zhang, H., Zhang, M., Li, Y.K., Wu, Y. and Guo, D., 2024. Deepseekmath: Pushing the limits of mathematical reasoning in open language models. arXiv preprint arXiv:2402.03300.
