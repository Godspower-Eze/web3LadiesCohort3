const { loadFixture } = require('@nomicfoundation/hardhat-network-helpers')
const { anyValue } = require('@nomicfoundation/hardhat-chai-matchers/withArgs')
const { expect } = require('chai')

describe('Test', function () {
  async function deployTextFixture() {
    const Test = await ethers.getContractFactory('Test')
    const test = await Test.deploy()
    return { test }
  }

  describe('Name', () => {
    it('Should return Godspower Eze as name', async function () {
      const { test } = await loadFixture(deployTextFixture)
      await expect(await test.name()).to.be.equal('Godspower Eze')
    })

    it('Should set name', async function () {
      const { test } = await loadFixture(deployTextFixture)
      await expect(await test.name()).to.be.equal('Godspower Eze')
      await test.updateName('Ogechi')
      await expect(await test.name()).to.be.equal('Ogechi')
      const name = await test.name()
      console.log(name)
    })
  })
})
