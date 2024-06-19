#!/usr/bin/env python

import gymnasium as gym
import logging

# Global variables
logging.basicConfig(level=logging.DEBUG)
gym_environment = "CartPole-v1"

env = gym.make(gym_environment)
observation, info = env.reset(seed=42)

for _ in range(1000):
    # TODO Store in Dataclass
    action = env.action_space.sample()
    (observation, reward, terminated, truncated, info) = env.step(action)
    logging.debug(observation)

    if terminated or truncated:
        observation, info = env.reset()

env.close()
